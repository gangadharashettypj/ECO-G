import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_game/utils/log/log.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handleNotification(message);
}

final orderRefreshStream = StreamController.broadcast();

bool refreshOrders = false;

void handleNotification(RemoteMessage message) {
  log.debug(
    title:
        'Got a message whilst in the foreground!\nTitle: ${message.notification?.title}\nBody: ${message.notification?.body}\nMessage data: ${message.data}',
  );
}

@lazySingleton
class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings? settings;

  String token = '';

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    token = await messaging.getToken() ?? '';

    log.debug(title: 'FCM TOKEN $token');

    await requestPermission();

    await subscribeToTopic('ALL_USER');

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    const initializationSettingsDarwin = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    if (settings?.authorizationStatus != AuthorizationStatus.authorized) {
      BotToast.showText(
          text: 'Please give notification permission to get order updates...');
      return;
    }

    listenForNotification();
  }

  Future<void> requestPermission() async {
    settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    log.debug(
        title: 'User granted permission: ${settings?.authorizationStatus}');
  }

  void listenForNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleNotification(message);

      final notification = message.notification;
      final android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
              ),
            ));
      }
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    log.debug(title: 'Subscribing to topic $topic');
    return messaging.subscribeToTopic(topic);
  }

  Future<void> unSubscribeToTopic(String topic) async {
    log.debug(title: 'Un subscribing from topic $topic');
    return messaging.unsubscribeFromTopic(topic);
  }
}

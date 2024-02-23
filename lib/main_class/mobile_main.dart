import 'package:flutter/material.dart';
import 'package:flutter_game/db/db.dart';
import 'package:flutter_game/di/di.dart';
import 'package:flutter_game/main_class/main_class.dart';
import 'package:flutter_game/pages/app_screen/app_screen.dart';

class MobileMain implements MainClass {
  @override
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    // if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    // }
    configureDependencies();
    await getIt<DB>().register();
    // if (Platform.isIOS || Platform.isAndroid) {
    //   getIt<NotificationService>().init();
    // }
    // if (Platform.isIOS || Platform.isAndroid) {
    //   AppRemoteConfig.instance.init();
    // }

    runApp(const AppScreen());
  }
}

MainClass getInstance() => MobileMain();

import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppRemoteConfig {
  static AppRemoteConfig? _instance;
  final remoteConfig = FirebaseRemoteConfig.instance;

  static AppRemoteConfig get instance {
    _instance ??= AppRemoteConfig();
    return _instance!;
  }

  int get minSoftUpdateVersion =>
      remoteConfig.getInt('user_min_soft_update_version');

  int get minHardUpdateVersion =>
      remoteConfig.getInt('user_min_hard_update_version');

  String get hardUpdateVersionList =>
      remoteConfig.getString('user_hard_update_versions');

  Future<void> init() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(minutes: 5),
      ),
    );
    await remoteConfig.fetchAndActivate();
    RemoteConfigValue(null, ValueSource.valueDefault);

    Future.delayed(const Duration(seconds: 3), () async {
      final data = await AppRemoteConfig.instance.canShowUpdateDialog();
      if (data != null) {
        // TODO FIX
        // showDialog(
        //   context: navigatorKey!.currentContext!,
        //   builder: (BuildContext context) {
        //     return UpdateDialog(
        //       isForce: data,
        //     );
        //   },
        //   barrierDismissible: false,
        // );
      }
    });
  }

  Future<bool?> canShowUpdateDialog() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = int.parse(packageInfo.buildNumber);

    try {
      List<dynamic> hardVersion = jsonDecode(hardUpdateVersionList);
      if (hardVersion.contains(buildNumber)) {
        return true;
      }
      if (buildNumber <= minHardUpdateVersion) {
        return true;
      }
      if (buildNumber <= minSoftUpdateVersion) {
        return false;
      }

      return null;
    } catch (e) {
      e.printError();
      return null;
    }
  }
}

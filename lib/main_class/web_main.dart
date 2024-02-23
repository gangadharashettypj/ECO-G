import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_game/db/db.dart';
import 'package:flutter_game/di/di.dart';
import 'package:flutter_game/main_class/main_class.dart';
import 'package:flutter_game/pages/app_screen/app_screen.dart';

class WebMain implements MainClass {
  @override
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    await getIt<DB>().register();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    String url = window.location.href.replaceAll('#/', '');
    final uri = Uri.parse(url);

    if (!uri.path.contains('splash-route') &&
        !uri.path.contains('login-route') &&
        uri.path != '/') {
      window.location.href = '${uri.scheme}://${uri.host}:${uri.port}';
    }
    runApp(const AppScreen());
  }
}

MainClass getInstance() => WebMain();

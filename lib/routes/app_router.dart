import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/pages/dashboard/dashboard.dart';
import 'package:flutter_game/pages/login/login.dart';
import 'package:flutter_game/pages/splash/splash.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: LoginRoute.page),
      ];
}

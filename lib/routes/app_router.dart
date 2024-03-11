import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/models/level_data_model.dart';
import 'package:flutter_game/pages/dashboard/game.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_game.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_game_controller.dart';
import 'package:flutter_game/pages/dashboard/games/bullet/bullet_rewards.dart';
import 'package:flutter_game/pages/home/home.dart';
import 'package:flutter_game/pages/options/options.dart';
import 'package:flutter_game/pages/splash/splash.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: GameRoute.page),
        AutoRoute(page: BulletGameRoute.page),
        AutoRoute(page: BulletRewardsRoute.page),
        AutoRoute(page: OptionsRoute.page),
      ];
}

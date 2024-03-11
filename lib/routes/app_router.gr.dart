// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BulletGameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BulletGameScreen(),
      );
    },
    BulletRewardsRoute.name: (routeData) {
      final args = routeData.argsAs<BulletRewardsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BulletRewardsScreen(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    GameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OptionsRoute.name: (routeData) {
      final args = routeData.argsAs<OptionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OptionsScreen(
          key: args.key,
          levelDataModel: args.levelDataModel,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [BulletGameScreen]
class BulletGameRoute extends PageRouteInfo<void> {
  const BulletGameRoute({List<PageRouteInfo>? children})
      : super(
          BulletGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'BulletGameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BulletRewardsScreen]
class BulletRewardsRoute extends PageRouteInfo<BulletRewardsRouteArgs> {
  BulletRewardsRoute({
    Key? key,
    required BulletGameController controller,
    List<PageRouteInfo>? children,
  }) : super(
          BulletRewardsRoute.name,
          args: BulletRewardsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'BulletRewardsRoute';

  static const PageInfo<BulletRewardsRouteArgs> page =
      PageInfo<BulletRewardsRouteArgs>(name);
}

class BulletRewardsRouteArgs {
  const BulletRewardsRouteArgs({
    this.key,
    required this.controller,
  });

  final Key? key;

  final BulletGameController controller;

  @override
  String toString() {
    return 'BulletRewardsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<void> {
  const GameRoute({List<PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OptionsScreen]
class OptionsRoute extends PageRouteInfo<OptionsRouteArgs> {
  OptionsRoute({
    Key? key,
    required LevelDataModel levelDataModel,
    List<PageRouteInfo>? children,
  }) : super(
          OptionsRoute.name,
          args: OptionsRouteArgs(
            key: key,
            levelDataModel: levelDataModel,
          ),
          initialChildren: children,
        );

  static const String name = 'OptionsRoute';

  static const PageInfo<OptionsRouteArgs> page =
      PageInfo<OptionsRouteArgs>(name);
}

class OptionsRouteArgs {
  const OptionsRouteArgs({
    this.key,
    required this.levelDataModel,
  });

  final Key? key;

  final LevelDataModel levelDataModel;

  @override
  String toString() {
    return 'OptionsRouteArgs{key: $key, levelDataModel: $levelDataModel}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

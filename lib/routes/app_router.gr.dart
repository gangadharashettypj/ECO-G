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

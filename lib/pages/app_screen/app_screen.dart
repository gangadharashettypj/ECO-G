import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/extension/color_extension.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/routes/app_router.dart';

GlobalKey<NavigatorState>? navigatorKey;

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final _appRouter = AppRouter();

  final _botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    navigatorKey = _appRouter.navigatorKey;
    return MaterialApp.router(
      builder: (context, child) {
        return _botToastBuilder(context, child);
      },
      theme: ThemeData(
        primaryColor: ColorName.primary,
        primarySwatch: ColorName.primary.materialColor,
        // textTheme: GoogleFonts.commissionerTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          secondary: ColorName.primary,
          seedColor: ColorName.primaryDark,
          surfaceTint: Colors.white,
          shadow: Colors.white,
          background: Colors.white,
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
        ),
        cardTheme: const CardTheme(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          color: Colors.white,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
            TargetPlatform.android: NoShadowCupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      color: Colors.white,
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [
          BotToastNavigatorObserver(),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

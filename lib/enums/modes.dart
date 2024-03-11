import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/gen/assets.gen.dart';
import 'package:flutter_game/routes/app_router.dart';

enum GameMode {
  bullet,
  blitz,
  // rapid,
}

extension GameModeExtension on GameMode {
  String get title {
    switch (this) {
      case GameMode.bullet:
        return 'Blitz';
      case GameMode.blitz:
        return 'Rapid';
      // case GameMode.rapid:
      //   return 'Rapid';
    }
  }

  String get subTitle {
    switch (this) {
      case GameMode.bullet:
        return 'Fast';
      case GameMode.blitz:
        return 'Choose';
      // case GameMode.rapid:
      //   return 'Timer';
    }
  }

  String get image {
    switch (this) {
      case GameMode.bullet:
        return Assets.images.rapid.path;
      case GameMode.blitz:
        return Assets.images.infinity.path;
      // case GameMode.rapid:
      //   return Assets.images.timer.path;
    }
  }

  Color get color {
    switch (this) {
      case GameMode.bullet:
        return Colors.yellow;
      case GameMode.blitz:
        return Colors.purple;
      // case GameMode.rapid:
      //   return Colors.greenAccent;
    }
  }

  PageRouteInfo get route {
    switch (this) {
      case GameMode.bullet:
        return const BulletGameRoute();
      case GameMode.blitz:
        return const BlitzGameRoute();
      // case GameMode.rapid:
      //   return const GameRoute();
    }
  }
}

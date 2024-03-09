import 'package:flutter/material.dart';
import 'package:flutter_game/gen/assets.gen.dart';

enum GameMode {
  bullet,
  blitz,
  rapid,
}

extension GameModeExtension on GameMode {
  String get title {
    switch (this) {
      case GameMode.bullet:
        return 'Bullet';
      case GameMode.blitz:
        return 'Blitz';
      case GameMode.rapid:
        return 'Rapid';
    }
  }

  String get subTitle {
    switch (this) {
      case GameMode.bullet:
        return 'Fast';
      case GameMode.blitz:
        return 'Choose';
      case GameMode.rapid:
        return 'Timer';
    }
  }

  String get image {
    switch (this) {
      case GameMode.bullet:
        return Assets.images.rapid.path;
      case GameMode.blitz:
        return Assets.images.infinity.path;
      case GameMode.rapid:
        return Assets.images.timer.path;
    }
  }

  Color get color {
    switch (this) {
      case GameMode.bullet:
        return Colors.yellow;
      case GameMode.blitz:
        return Colors.purple;
      case GameMode.rapid:
        return Colors.greenAccent;
    }
  }
}

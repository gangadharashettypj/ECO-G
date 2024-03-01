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
}

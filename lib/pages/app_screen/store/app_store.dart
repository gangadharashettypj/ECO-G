import 'package:flutter_game/di/di.dart';
import 'package:injectable/injectable.dart';

AppStore get appStoreInstance => getIt<AppStore>();

@lazySingleton
class AppStore {}

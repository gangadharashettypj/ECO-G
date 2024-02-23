import 'package:flutter_game/di/di.dart';
import 'package:flutter_game/pages/dashboard/controller/home_controller.dart';
import 'package:injectable/injectable.dart';

HomeStore get homeStoreInstance => getIt<HomeStore>();

@lazySingleton
class HomeStore {
  final controller = getIt<HomeController>();
}

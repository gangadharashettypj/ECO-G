import 'main_class_stub.dart'
    if (dart.library.io) 'mobile_main.dart'
    if (dart.library.html) 'web_main.dart';

abstract class MainClass {
  Future<void> main();

  factory MainClass() => getInstance();
}

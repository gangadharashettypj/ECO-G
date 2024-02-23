import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:flutter_game/utils/log/prefix_printer.dart';

@module
abstract class LoggerDi {
  @lazySingleton
  Logger get logger {
    return Logger(
      filter: null,
      printer: AppPrefixPrinter(
        PrettyPrinter(
          methodCount: 3,
          // number of method calls to be displayed
          errorMethodCount: 10,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: true, // Should each log print contain a timestamp
        ),
      ),
      output: null,
    );
  }
}

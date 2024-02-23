import 'package:logger/logger.dart';

class AppPrefixPrinter extends LogPrinter {
  final LogPrinter _realPrinter;
  late Map<Level, String> _prefixMap;

  AppPrefixPrinter(
    this._realPrinter, {
    String? debug,
    String? verbose,
    String? wtf,
    String? info,
    String? warning,
    String? error,
    String? nothing,
  }) : super() {
    _prefixMap = {
      Level.debug: debug ?? '  DEBUG ',
      Level.trace: verbose ?? 'VERBOSE ',
      Level.fatal: wtf ?? '    WTF ',
      Level.info: info ?? '   INFO ',
      Level.warning: warning ?? 'WARNING ',
      Level.error: error ?? '  ERROR ',
      Level.off: nothing ?? 'NOTHING',
    };
  }

  @override
  List<String> log(LogEvent event) {
    return _realPrinter
        .log(event)
        .map((s) => '${_prefixMap[event.level]}$s')
        .toList();
  }
}

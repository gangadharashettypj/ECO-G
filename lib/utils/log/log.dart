import 'package:flutter/foundation.dart' show debugPrint;
import 'package:logger/logger.dart';
import 'package:flutter_game/constants/constants.dart';

class Log {
  final Logger _logger;

  Log(this._logger);

  void _doReport({
    required String title,
    dynamic error,
    StackTrace? stackTrace,
    bool? report,

    /// this will be used for sentry
    Map<String, String>? extras,
  }) {
    // if (!doReport!) {
    //   return;
    // }

    // _crashesService.capture(
    //   title: title,
    //   error: error,
    //   stackTrace: stackTrace,
    //   fullStackTrace: StackTrace.current,
    //   extras: extras,
    // );
  }

  void verbose({
    required String title,
    dynamic error,
    StackTrace? stackTrace,
    bool? report,

    /// this will be used for sentry
    Map<String, String>? extras,
  }) {
    _doReport(
      title: title,
      error: error,
      stackTrace: stackTrace,
      report: report,
      extras: extras,
    );

    if (!enableDebugLogs) {
      return;
    }

    _logger.t(title, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void debug({
    required String title,
    dynamic error,
    StackTrace? stackTrace,
    bool? report,

    /// this will be used for sentry
    Map<String, String>? extras,
  }) {
    _doReport(
      title: title,
      error: error,
      stackTrace: stackTrace,
      report: report,
      extras: extras,
    );

    if (!enableDebugLogs) {
      return;
    }
    _logger.d(title, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void info({
    required String title,
    dynamic error,
    StackTrace? stackTrace,
    bool? report,

    /// this will be used for sentry
    Map<String, String>? extras,
  }) {
    _doReport(
      title: title,
      error: error,
      stackTrace: stackTrace,
      report: report,
      extras: extras,
    );

    if (!enableDebugLogs) {
      return;
    }

    _logger.i(title, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warn({
    required String title,
    dynamic error,
    StackTrace? stackTrace,
    bool? report,

    /// this will be used for sentry
    Map<String, String>? extras,
  }) {
    _doReport(
      title: title,
      error: error,
      stackTrace: stackTrace,
      report: report,
      extras: extras,
    );

    if (!enableDebugLogs) {
      return;
    }

    _logger.w(title, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  void error({
    required String title,
    required dynamic error,
    StackTrace? stackTrace,
    bool? report,

    /// this will be used for sentry
    Map<String, String>? extras,

    /// [bool] log to console
    bool logToConsole = true,
  }) {
    _doReport(
      title: title,
      error: error,
      stackTrace: stackTrace,
      report: report,
      extras: extras,
    );

    if (!enableDebugLogs) {
      return;
    }

    if (!logToConsole) {
      return;
    }

    _logger.e(title, error: error, stackTrace: stackTrace);
  }

  void wtf({
    required String title,
    dynamic error,
    StackTrace? stackTrace,
    bool? report,
    Map<String, String>? extras,
  }) {
    _doReport(
      title: title,
      error: error,
      stackTrace: stackTrace,
      report: report,
      extras: extras,
    );

    if (!enableDebugLogs) {
      return;
    }

    _logger.f(title, error: error, stackTrace: stackTrace);
  }

  void print(String title, String message, {String? prefix}) {
    if (!enableDebugLogs) {
      return;
    }

    if (prefix != null && prefix.isNotEmpty) {
      title = '$prefix : $title';
    }

    debugPrint('━━━━ $title => $message ━━━━');
  }
}

final Log log = Log(
  Logger(
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  ),
);

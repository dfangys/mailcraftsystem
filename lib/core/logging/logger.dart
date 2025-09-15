import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Application logger utility
class AppLogger {
  static Logger? _instance;
  
  /// Initialize the logger
  static void init() {
    _instance = Logger(
      level: kDebugMode ? Level.debug : Level.info,
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
      filter: ProductionFilter(),
    );
  }
  
  /// Get the logger instance
  static Logger get instance {
    assert(_instance != null, 'Logger not initialized. Call AppLogger.init() first.');
    return _instance!;
  }
  
  /// Log debug message
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.d(message, error: error, stackTrace: stackTrace);
  }
  
  /// Log info message
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.i(message, error: error, stackTrace: stackTrace);
  }
  
  /// Log warning message
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.w(message, error: error, stackTrace: stackTrace);
  }
  
  /// Log error message
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.e(message, error: error, stackTrace: stackTrace);
  }
  
  /// Log fatal message
  static void fatal(String message, [dynamic error, StackTrace? stackTrace]) {
    instance.f(message, error: error, stackTrace: stackTrace);
  }
}

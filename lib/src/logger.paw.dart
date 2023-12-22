import './colors/ansi.paw.dart';
import './utils/utils.paw.dart';

///
/// A beautiful printer for your logs 🐾
///
/// Log your code's journey with every paw print.
///
class Paw {
  ///
  /// Private constructor to prevent instantiation
  ///
  Paw._({
    required this.name,
    required this.maxStackTraces,
    required this.shouldPrintName,
    required this.shouldPrintLogs,
    required this.shouldIncludeSourceInfo,
  });

  ///
  /// Name to be printed
  ///
  final String name;

  ///
  /// Max amount of stack traces allowed to print
  ///
  final int maxStackTraces;

  ///
  /// Indicates to print name on the console or not
  ///
  final bool shouldPrintName;

  ///
  /// Indicates whether printing logs is allowed or not
  ///
  final bool shouldPrintLogs;

  ///
  /// Indicates whether to print source file info or not
  ///
  final bool shouldIncludeSourceInfo;

  // Singleton instance
  static Paw? _instance;

  ///
  /// Initializes the singleton instance of `Paw` with optional configuration.
  ///
  /// This method creates and returns a singleton instance of the `Paw` class.
  /// It allows customization of the log name, maximum stack traces to print, and
  /// whether the name should be printed on the console.
  ///
  /// Example:
  /// ```
  /// // init paw logger in root of your project
  /// Paw.init(
  ///  name: "myApp",
  ///  maxStackTraces: 5,
  ///  shouldPrintName: true,
  ///  shouldPrintLogs: true,
  ///  shouldIncludeSourceInfo: false,
  /// );
  /// ```
  static Paw init({
    String name = 'PAW',
    int maxStackTraces = 5,
    bool shouldPrintName = true,
    bool shouldPrintLogs = true,
    bool shouldIncludeSourceInfo = true,
  }) {
    if (_instance == null) {
      _instance = Paw._(
        name: name.isEmpty ? "PAW" : name,
        maxStackTraces: maxStackTraces,
        shouldPrintName: shouldPrintName,
        shouldPrintLogs: shouldPrintLogs,
        shouldIncludeSourceInfo: shouldIncludeSourceInfo,
      );

      _onInitLog("Paw has been initialised");
    }

    return _instance!;
  }

  ///
  /// Get a singleton instance of `Paw`
  ///
  factory Paw() {
    if (_instance == null) {
      _onInitError();
    }

    return _instance!;
  }

  ///
  /// Throws an error if the user tries to access `Paw` without calling [init()].
  ///
  /// This internal method is responsible for throwing an error when the user attempts
  /// to access the `Paw` singleton instance without initializing it first using
  /// the [init] method. The error message provides guidance on initializing the instance.
  ///
  static void _onInitError() {
    const errorMsg =
        "`Paw` is not yet initialised, initialise it with `Paw.init()`";

    final prettyError = PawUtils.getPrettyError(errorMsg);

    print(prettyError);

    throw Exception(errorMsg);
  }

  ///
  /// Logs an initialization message for `Paw`.
  ///
  static void _onInitLog(String msg) {
    final timeStamp = PawUtils.getCurrentTimeStamp();

    final title = PawUtils.getDecoratedName("PAW", true);

    final decoratedLevel = PawUtils.getDecoratedString(
      "INFO",
      fg: AnsiFgColor.black,
      bg: AnsiBgColor.yellow,
    );

    final decoratedLog = PawUtils.getDecoratedString(
      "$timeStamp | $msg",
      fg: AnsiFgColor.yellow,
    );

    print("$title$decoratedLevel $decoratedLog");
  }

  ///
  /// Logs an informational message to the debug console.
  ///
  /// This method is used to log informational messages to the debug console
  /// with formatted decorations and additional information such as source file,
  /// timestamp, and the provided message.
  ///
  /// Example:
  /// ```
  /// // Log an informational message
  /// Paw().info('This is an informational message');
  /// ```
  ///
  void info(
    String msg, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    final timeStamp = PawUtils.getCurrentTimeStamp();

    final sourceFileInfo = PawUtils.getSourceFileInfo(
      stackTrace,
      shouldIncludeSourceInfo,
    );

    final title = PawUtils.getDecoratedName(name, shouldPrintName);

    final decoratedLevel = PawUtils.getDecoratedString(
      "INFO",
      fg: AnsiFgColor.black,
      bg: AnsiBgColor.yellow,
    );

    final decoratedLog = PawUtils.getDecoratedString(
      "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp | $msg",
      fg: AnsiFgColor.yellow,
    );

    _printLog("$title$decoratedLevel $decoratedLog");
  }

  ///
  /// Logs a warning message to the debug console.
  ///
  /// This method is used to log warning messages to the debug console
  /// with formatted decorations and additional information such as source file,
  /// timestamp, and the provided warning message.
  ///
  /// Example:
  /// ```
  /// // Log a warning message
  /// Paw().warn('This is a warning message');
  /// ```
  ///
  void warn(
    String msg, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    final timeStamp = PawUtils.getCurrentTimeStamp();

    final sourceFileInfo = PawUtils.getSourceFileInfo(
      stackTrace,
      shouldIncludeSourceInfo,
    );

    final title = PawUtils.getDecoratedName(name, shouldPrintName);

    final decoratedLevel = PawUtils.getDecoratedString(
      "WARN",
      fg: AnsiFgColor.lightPink,
      bg: AnsiBgColor.pink,
    );

    final decoratedLog = PawUtils.getDecoratedString(
      "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp | $msg",
      fg: AnsiFgColor.pink,
    );

    _printLog("$title$decoratedLevel $decoratedLog");
  }

  ///
  /// Logs an object or data for preview during debugging.
  ///
  /// This method is used to log debug messages containing an object or data structure
  /// for preview purposes during debugging. It prints formatted decorations, source file
  /// information, timestamp, and a prettified representation of the provided object.
  ///
  /// Example:
  /// ```
  /// // Log a debug message with an object for debugging
  /// Paw().debug({'key': 'value', 'count': 42});
  /// ```
  ///
  void debug(
    Object obj, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    final timeStamp = PawUtils.getCurrentTimeStamp();

    final sourceFileInfo = PawUtils.getSourceFileInfo(
      stackTrace,
      shouldIncludeSourceInfo,
    );

    final title = PawUtils.getDecoratedName(name, shouldPrintName);

    final decoratedLevel = PawUtils.getDecoratedString(
      "DEBUG",
      fg: AnsiFgColor.black,
      bg: AnsiBgColor.lightPink,
    );

    final decoratedLog = PawUtils.getDecoratedString(
      "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp",
      fg: AnsiFgColor.lightPink,
    );

    final decoratedObj = PawUtils.getPrettyObject(obj);

    _printLog("$title$decoratedLevel $decoratedLog");
    _printLog(decoratedObj);
  }

  ///
  /// Logs an error message with details, including the error and stack trace.
  ///
  /// This method is used to log error messages with formatted decorations,
  /// source file information, timestamp, the provided error message, and the
  /// associated stack trace. It provides a comprehensive view of errors during
  /// debugging.
  ///
  /// Example:
  /// ```
  /// try {
  ///   throw UnsupportedError("Oops! You've forgotten to implement this feature");
  /// } catch (e, stackTrace) {
  ///   // Log an error with a message, error object, and stack trace
  ///   Paw().error('An unexpected error occurred', error: e, stackTrace: stackTrace);
  /// }
  /// ```
  ///
  void error(
    String msg, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    final timeStamp = PawUtils.getCurrentTimeStamp();

    final sourceFileInfo = PawUtils.getSourceFileInfo(
      stackTrace,
      shouldIncludeSourceInfo,
    );

    final title = PawUtils.getDecoratedName(name, shouldPrintName);

    final decoratedLevel = PawUtils.getDecoratedString(
      "ERROR",
      fg: AnsiFgColor.white,
      bg: AnsiBgColor.orange,
    );

    final decoratedLog = PawUtils.getDecoratedString(
      "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp | $msg",
      fg: AnsiFgColor.orange,
    );

    final decoratedError = PawUtils.getPrettyError(error);
    final decoratedSt = PawUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
    );

    _printLog("$title$decoratedLevel $decoratedLog");

    if (decoratedError.isNotEmpty) {
      _printLog(decoratedError);
    }

    if (decoratedSt.isNotEmpty) {
      _printLog(decoratedSt);
    }
  }

  ///
  /// Prints the log message to the console when the application is in debug mode.
  ///
  /// This internal method is used to print the log message to the console using
  /// [debugPrint]. The log will be printed only when the application is running
  /// in debug mode. It ensures that log messages are displayed during development
  /// but not in release builds.
  ///
  /// Logs will not be printed if [shouldPrintLogs] is set to `false` by user
  ///
  /// Example:
  /// ```
  /// // Internal method to print a log message
  /// _printLog('This is a log message');
  /// ```
  ///
  void _printLog(String log) {
    if (shouldPrintLogs) {
      print(log);
    }
  }
}

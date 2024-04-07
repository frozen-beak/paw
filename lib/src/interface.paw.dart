import 'ansi/ansi.paw.dart';
import 'themes/themes.paw.dart';
import 'utils/utils.paw.dart';

///
/// `PawInterface` is an abstract class for building custom loggers with Paw.
///
/// ### Example:
/// ```
/// class MyLogger extends PawInterface {
///   MyLogger({
///     super.name = "MyApp",
///     super.maxStackTraces = 5,
///     super.shouldIncludeSourceInfo = false,
///     super.shouldPrintLogs = true,
///     super.shouldPrintName = true,
///   }) : super(currentTheme: PawDarkTheme());
///
///   @override
///   void info(String message, {StackTrace? stackTrace}) {
///     super.info(message, stackTrace: stackTrace);
///
///     // do something here if needed
///   }
/// }
///
/// void main() {
///   final logger = MyLogger();
///
///   logger.info('This is an informational message');
///   logger.trace('This is trace log');
///   logger.debug({'key': 'value', 'count': 42});
///   logger.warn('This is a warning message');
///   logger.error('An unexpected error occurred', error: e);
///   logger.fetal('An fetal error occurred', error: e, stackTrace: stackTrace);
/// }
/// ```
///
abstract class PawInterface {
  ///
  /// Constructs a new instance of `PawInterface`.
  ///
  PawInterface({
    PawTheme? currentTheme,
    this.name = "Paw",
    this.shouldPrintLogs = true,
    this.shouldPrintName = true,
    this.maxStackTraces = 5,
    this.shouldIncludeSourceInfo = true,
    this.logLevel,
  }) : currentTheme = currentTheme ?? PawDarkTheme();

  ///
  /// Custom name for the logger, default to "Paw"
  ///
  final String name;

  ///
  /// Max number of stack traces allowed to print
  ///
  final int maxStackTraces;

  ///
  /// Control whether Paw should print logs or not
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

  ///
  /// Color theme for styling Paw, default to `PawDarkTheme`
  ///
  final PawTheme currentTheme;

  ///
  /// Specify a specific log level to print and only print logs for that level
  /// and hide others.
  ///
  /// If set to `null`, all log levels will be printed.
  ///
  final PawLogLevels? logLevel;

  ///
  /// Logs an informational message to the debug console.
  ///
  /// This function also logs additional information such as source file,
  /// timestamp, and the provided message.
  ///
  /// ### Example:
  /// ```
  /// // Log an informational message
  /// Paw.info('This is an informational message');
  /// ```
  ///
  void info(
    String message, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.info) return;

    final String decoratedHeading = LoggingUtils.getDecoratedLogHeading(
      PawLogLevels.info,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgInfo,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = LoggingUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = LoggingUtils.getDecoratedString(
      message,
      fgColor: currentTheme.message,
    );

    LoggingUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
  }

  ///
  /// Log detailed tracing information. Ideal for high-volume logs.
  ///
  /// This function also logs additional information such as source file,
  /// timestamp, and the provided message.
  ///
  /// ### Example:
  /// ```
  /// // Log an informational message
  /// Paw.trace('This is a trace log message');
  /// ```
  ///
  void trace(
    String message, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.trace) return;

    final String decoratedHeading = LoggingUtils.getDecoratedLogHeading(
      PawLogLevels.trace,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgTrace,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = LoggingUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = LoggingUtils.getDecoratedString(
      message,
      fgColor: currentTheme.message,
    );

    LoggingUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
  }

  ///
  /// Log debugging information. Essential for troubleshooting and understanding
  /// complex flows.
  ///
  /// This function also logs additional information such as source file,
  /// timestamp.
  ///
  /// ### Example:
  /// ```
  /// // Log an informational message
  /// Paw.trace('This is a trace log message');
  /// ```
  ///
  void debug(
    Object obj, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.debug) return;

    final String decoratedHeading = LoggingUtils.getDecoratedLogHeading(
      PawLogLevels.debug,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgDebug,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = LoggingUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final prettyObject = LoggingUtils.getPrettyObject(
      obj,
      currentTheme: currentTheme,
    );

    LoggingUtils.log("$decoratedHeading$decoratedInfoCard \n$prettyObject");
  }

  ///
  /// Log warnings. Use this for non-critical issues that should be noted.
  ///
  /// This function also logs additional information such as source file,
  /// timestamp, and the provided warning message.
  ///
  /// ### Example:
  /// ```
  /// // Log an informational message
  /// Paw.warn('This is a warning log message to make you alert!');
  /// ```
  ///
  void warn(
    String message, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.warn) return;

    final String decoratedHeading = LoggingUtils.getDecoratedLogHeading(
      PawLogLevels.warn,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgWarn,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = LoggingUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = LoggingUtils.getDecoratedString(
      message,
      fgColor: currentTheme.errorMessage,
      textStyle: AnsiTextStyles.italic,
    );

    LoggingUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
  }

  ///
  /// Log errors with detailed information, including error objects and stack
  /// traces. Critical for error tracking.
  ///
  /// This function also logs additional information such as source file,
  /// timestamp, and the provided error message.
  ///
  /// ### Example:
  /// ```
  /// try {
  ///   throw UnsupportedError("Oops! You've forgotten to implement this feature");
  /// } catch (e, stackTrace) {
  ///   // Log an error with a message, error object, and stack trace
  ///   Paw.error('An unexpected error occurred', error: e, stackTrace: stackTrace);
  /// }
  /// ```
  ///
  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.error) return;

    final String decoratedHeading = LoggingUtils.getDecoratedLogHeading(
      PawLogLevels.error,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgError,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = LoggingUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = LoggingUtils.getDecoratedString(
      message,
      fgColor: currentTheme.errorMessage,
    );

    final prettyError = LoggingUtils.getPrettyError(
      error,
      currentTheme: currentTheme,
    );

    final prettyStacktrace = LoggingUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
      currentTheme: currentTheme,
    );

    final decoratedDivider = LoggingUtils.getDecoratedString(
      "----------",
      fgColor: currentTheme.errorMessage,
    );

    LoggingUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");

    LoggingUtils.log(
      "$decoratedDivider\n$prettyError\n${prettyStacktrace.isNotEmpty ? "\n$prettyStacktrace\n" : ""}$decoratedDivider",
    );
  }

  ///
  /// Logs a serious error with details, including the error and stack trace.
  ///
  /// This function also logs additional information such as source file,
  /// timestamp, and the provided error message.
  ///
  /// ### Example:
  /// ```
  /// try {
  ///   throw UnsupportedError("Oops! The code is causing some serious issues");
  /// } catch (e, stackTrace) {
  ///   // Log a fetal error with a message, error object, and stack trace
  ///   Paw.fetal('An serious error occurred', error: e, stackTrace: stackTrace);
  /// }
  /// ```
  ///
  void fetal(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.fetal) return;

    final String decoratedHeading = LoggingUtils.getDecoratedLogHeading(
      PawLogLevels.fetal,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgFetal,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = LoggingUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = LoggingUtils.getDecoratedString(
      message,
      fgColor: currentTheme.errorMessage,
    );

    final prettyError = LoggingUtils.getPrettyError(
      error,
      currentTheme: currentTheme,
    );

    final prettyStacktrace = LoggingUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
      currentTheme: currentTheme,
    );

    final decoratedDivider = LoggingUtils.getDecoratedString(
      "----------",
      fgColor: currentTheme.errorMessage,
    );

    LoggingUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");

    LoggingUtils.log(
      "$decoratedDivider\n$prettyError\n${prettyStacktrace.isNotEmpty ? "\n$prettyStacktrace\n" : ""}$decoratedDivider",
    );
  }
}

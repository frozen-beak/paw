import 'colors/ansi.paw.dart';
import 'themes/core/interface.theme.paw.dart';
import 'utils/log_levels.utils.paw.dart';
import 'utils/utils.paw.dart';

///
/// `PawInterface` - An Abstract class to help build a custom logger with
/// help of [Paw 🐾]
///
/// Example:
/// ```
/// class MyLogger extends PawInterface {
///   MyLogger() : super(name: 'MyLogger');
///
///   @override
///   void info(String msg, {StackTrace? stackTrace}) {
///     super.info(msg, stackTrace: stackTrace);///
///
///     // do something here if needed
///   }
/// }
///
/// void main() {
///   final logger = MyLogger();
///
///   logger.info('This is an informational message');
///   logger.warn('This is a warning message');
///   logger.debug({'key': 'value', 'count': 42});
///   logger.error('An unexpected error occurred');
/// }
/// ```
///
abstract class PawInterface {
  ///
  /// Constructor for the PAW
  ///
  PawInterface({
    required this.name,
    required this.currentTheme,
    this.shouldPrintLogs = true,
    this.shouldPrintName = true,
    this.maxStackTraces = 5,
    this.shouldIncludeSourceInfo = true,
    this.logLevel,
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

  ///
  /// Color theme for styling Paw
  ///
  final PawTheme currentTheme;

  ///
  /// Set a specific log level to only print the logs for specific level and
  /// hide other levels
  ///
  final PawLogLevels? logLevel;

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
    String message, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.info) return;

    final String decoratedHeading = PawUtils.getDecoratedLogHeading(
      PawLogLevels.info,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgInfo,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = PawUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = PawUtils.getDecoratedString(
      message,
      fgColor: currentTheme.message,
    );

    PawUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
  }

  ///
  /// Log detailed tracing information. Ideal for high-volume logs.
  ///
  /// This method is used to log tracing info to the debug console with
  /// formatted decorations and additional information such as source file,
  /// timestamp, and the provided message.
  ///
  /// Example:
  /// ```
  /// // Log tracing info
  /// Paw().trace('Paw is up and running!');
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

    final String decoratedHeading = PawUtils.getDecoratedLogHeading(
      PawLogLevels.trace,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgTrace,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = PawUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = PawUtils.getDecoratedString(
      message,
      fgColor: currentTheme.message,
    );

    PawUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
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

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.debug) return;

    final String decoratedHeading = PawUtils.getDecoratedLogHeading(
      PawLogLevels.debug,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgDebug,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = PawUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedObject = PawUtils.getPrettyObject(
      obj,
      currentTheme: currentTheme,
    );

    PawUtils.log("$decoratedHeading$decoratedInfoCard \n$decoratedObject");
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
    String message, {
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.warn) return;

    final String decoratedHeading = PawUtils.getDecoratedLogHeading(
      PawLogLevels.warn,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgWarn,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = PawUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = PawUtils.getDecoratedString(
      message,
      fgColor: currentTheme.errorMessage,
      textStyle: AnsiTextStyles.italic,
    );

    PawUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
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
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.error) return;

    final String decoratedHeading = PawUtils.getDecoratedLogHeading(
      PawLogLevels.error,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgError,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = PawUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = PawUtils.getDecoratedString(
      message,
      fgColor: currentTheme.errorMessage,
    );

    final decoratedError = PawUtils.getPrettyError(
      error,
      currentTheme: currentTheme,
    );

    final prettyStacktrace = PawUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
      currentTheme: currentTheme,
    );

    final decoratedDivider = PawUtils.getDecoratedString(
      "----------",
      fgColor: currentTheme.errorMessage,
    );

    PawUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
    PawUtils.log(
      "$decoratedDivider\n$decoratedError\n${prettyStacktrace.isNotEmpty ? "\n$prettyStacktrace\n" : ""}$decoratedDivider",
    );
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
  void fetal(
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    // Do nothing if logLevel is set to a specific log level
    if (logLevel != null && logLevel != PawLogLevels.fetal) return;

    final String decoratedHeading = PawUtils.getDecoratedLogHeading(
      PawLogLevels.fetal,
      shouldPrintName: shouldPrintName,
      name: name,
      bgColor: currentTheme.bgFetal,
      currentTheme: currentTheme,
    );

    final decoratedInfoCard = PawUtils.getDecoratedInfoCard(
      shouldIncludeSourceFileInfo: shouldIncludeSourceInfo,
      currentTheme: currentTheme,
      stackTrace: stackTrace,
    );

    final decoratedMessage = PawUtils.getDecoratedString(
      message,
      fgColor: currentTheme.errorMessage,
    );

    final decoratedError = PawUtils.getPrettyError(
      error,
      currentTheme: currentTheme,
    );

    final prettyStacktrace = PawUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
      currentTheme: currentTheme,
    );

    final decoratedDivider = PawUtils.getDecoratedString(
      "----------",
      fgColor: currentTheme.errorMessage,
    );

    PawUtils.log("$decoratedHeading$decoratedInfoCard $decoratedMessage");
    PawUtils.log(
      "$decoratedDivider\n$decoratedError\n${prettyStacktrace.isNotEmpty ? "\n$prettyStacktrace\n" : ""}$decoratedDivider",
    );
  }
}

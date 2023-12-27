import 'package:paw/paw.dart';

class MyLogger extends PawInterface {
  MyLogger({
    super.name = "MyApp",
    super.maxStackTraces = 5,
    super.shouldIncludeSourceInfo = false,
    super.shouldPrintLogs = true,
    super.shouldPrintName = true,
  });

  @override
  void info(String msg, {StackTrace? stackTrace}) {
    super.info(msg, stackTrace: stackTrace);

    print("Some task can be done after logging info");
  }
}

///
/// This is an example showcasing how to use the PawInterface to implement
/// your custom logger in dart / flutter applications
///
/// You can run this example by executing `dart example/custom_logger_example.dart`
/// in your terminal.
///
void main() {
  ///
  /// Create an instance of custom [logger]. This is how you interact with
  /// the logging system.
  ///
  final logger = MyLogger();

  ///
  /// Log an informational message.
  ///
  /// Use this for general app flow information, which could be helpful for
  /// understanding the app's behavior.
  ///
  logger.info("This is an informational message");

  ///
  /// Log a warning message.
  /// Warnings are useful for non-critical issues that should be
  /// brought to attention.
  ///
  logger.warn("Be aware! This is a warning message");

  ///
  /// Log a data object for debugging.
  ///
  /// This is particularly useful for logging structured data, making it
  /// easier to understand complex data states.
  ///
  logger.debug({'key': 'value', 'count': 42});

  ///
  /// Log an error with additional context.
  /// Here you can pass a message, an error object, and even a stack trace
  /// for in-depth debugging.
  ///
  /// Use this for logging exceptions or errors that occur in your application.
  ///
  try {
    throw UnsupportedError("Oops! You've forgotten to implement this feature");
  } catch (e, stackTrace) {
    // Log an error with a message, error object, and stack trace
    logger.error(
      'An unexpected error occurred',
      stackTrace: stackTrace,
      error: UnsupportedError(
        "Oops! You've forgotten to implement this feature",
      ),
    );
  }
}

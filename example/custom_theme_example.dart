import 'package:paw/paw.dart';

///
/// Custom theme create using [PawCustomTheme] to customise colors of the logs
/// printed on the consol with [Paw]
///
final kCustomTheme = PawCustomTheme(
  heading: AnsiForegroundColors.black,
  message: AnsiForegroundColors.softPink,
  object: AnsiForegroundColors.gray,
  errorMessage: AnsiForegroundColors.orange,
  errorObject: AnsiForegroundColors.red,
  bgWarn: AnsiBackgroundColor.lightGray,
  bgInfo: AnsiBackgroundColor.blue,
  bgTrace: AnsiBackgroundColor.darkPink,
  bgDebug: AnsiBackgroundColor.gray,
  bgError: AnsiBackgroundColor.darkPink,
  bgFetal: AnsiBackgroundColor.brown,
  infoCardBg: AnsiBackgroundColor.custom(r: 204, g: 255, b: 153),
);

///
/// This is an example showcasing how to use the Paw logging library with your
/// custom theme.
///
/// You can run this example by executing `dart example/custom_theme_example.dart`
/// in your terminal.
///
void main() {
  ///
  /// Create an instance of [paw] with custom configurations. This is how you
  /// interact with the logging system.
  ///
  final paw = Paw(
    title: "MyApp",
    shouldIncludeSourceFileInfo: true,
    shouldIncludeTitle: true,
    shouldPrint: true,
    stackTraceToPrint: 5,
    theme: kCustomTheme,

    // Note: When the `level` is set to [null], Paw is allowed to print logs
    // of all levels. To only print logs of a certain level, set the `level` to
    // that specific level, e.g. [PawLogLevels.fetal] to only print fetal logs

    level: PawLogLevels.fetal, // this allows paw to print all the logs,
  );

  ///
  /// Log an informational message.
  ///
  /// Use this for general app flow information, which could be helpful for
  /// understanding the app's behavior.
  ///
  paw.info("This is an informational message");

  ///
  /// Log a tracing message
  ///
  /// Use this for tracking code flow and high-volume logs
  ///
  paw.trace("This is a trace log");

  ///
  /// Log a warning message.
  /// Warnings are useful for non-critical issues that should be
  /// brought to attention.
  ///
  paw.warn("Be aware! This is a warning message");

  ///
  /// Log a data object for debugging.
  ///
  /// This is particularly useful for logging structured data, making it
  /// easier to understand complex data states.
  ///
  paw.debug({'key': 'value', 'count': 42});

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
    // Log an error with a message and error object
    paw.error(
      'An unexpected error occurred',
      error: e,
    );

    // Log a fetal log with a message, error object, and stack trace
    paw.fetal(
      'A very serious error occurred',
      stackTrace: stackTrace,
      error: e,
    );
  }
}

import 'package:paw/paw.dart';

///
/// This is an example showcasing how to use the Paw logging library in Flutter.
/// You can run this example by executing `dart example/main.dart` in your terminal.
///
void main() {
  // Initialize the Paw logger.
  // Paw is designed as a singleton, which means that you only need one instance throughout your app.
  // This prevents the creation of multiple instances and thus conserves resources.
  Paw.init(
    name:
        "Example", // Set the name of the logger, this helps in identifying logs if you have multiple loggers.
    maxStackTraces:
        5, // Limit the number of stack traces to keep memory usage in check.
    shouldIncludeSourceInfo:
        true, // Include source information (like file name and line number) in logs for easier debugging.
    shouldPrintLogs: true, // Enable printing of logs to the console.
    shouldPrintName:
        true, // Include the logger's name in the logs for better traceability.
  );

  // Create an instance of Paw. This is how you interact with the logging system.
  final paw = Paw();

  // Log an informational message.
  // Use this for general app flow information, which could be helpful for understanding the app's behavior.
  paw.info("This is an informational message");

  // Log a warning message.
  // Warnings are useful for non-critical issues that should be brought to attention.
  paw.warn("Be aware! This is a warning message");

  // Log a data object for debugging.
  // This is particularly useful for logging structured data, making it easier to understand complex data states.
  paw.debug({'key': 'value', 'count': 42});

  // Log an error with additional context.
  // Here you can pass a message, an error object, and even a stack trace for in-depth debugging.
  // Use this for logging exceptions or errors that occur in your application.
  paw.error(
    'An unexpected error occurred',
    error: UnsupportedError("Oops! You've forgotten to implement this feature"),
    stackTrace:
        null, // Here you might want to add a real stack trace in a real-world scenario
  );
}

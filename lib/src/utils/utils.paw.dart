import 'dart:convert';

import '../colors/ansi.paw.dart';

///
/// A utility class for [PawPrint]
///
/// This class provides a collection of utility functions for logging,
/// debugging, and formatting messages for better visibility during development.
///
class PawUtils {
  ///
  /// Get a decorated `name` based on specified conditions.
  ///
  /// If the `name` is empty string or `shouldPrintName` is `false`, an empty string is returned.
  ///
  /// Example:
  /// ```
  /// String decoratedName = PawUtils.getDecoratedName("PAW", true);
  ///
  /// print(decoratedName); // Outputs: Name styled with ANSI escape codes
  /// ```
  static String getDecoratedName(String name, bool shouldPrintName) {
    if (!shouldPrintName || name.isEmpty) return '';

    return getDecoratedString(
      name,
      fg: AnsiForegroundColors.oldWhite,
      bg: AnsiBackgroundColor.blue,
    );
  }

  ///
  /// Decorates a given text with foreground [fg] color and optional background [bg] color and style.
  ///
  /// Example:
  /// ```dart
  /// String decoratedText = PawUtils.getDecoratedString(
  ///   "Hello, World!",
  ///   fg: AnsiFgColor.green,
  ///   bg: AnsiBgColor.yellow,
  ///   style: AnsiStyle.bold,
  /// );
  ///
  /// print(decoratedText); // Outputs: String styled with ANSI escape codes
  /// ```
  ///
  static String getDecoratedString(
    String text, {
    required AnsiForegroundColors fg,
    AnsiTextStyles? style,
    AnsiBackgroundColor? bg,
  }) {
    final fgCode = fg.code;
    final bgCode = bg != null ? bg.code : '';
    final styleCode = style != null ? style.code : '';

    return "$bgCode$fgCode$styleCode $text $kAnsiEscapeCode";
  }

  ///
  /// Get the current timestamp in `hh:mm:ss` format.
  ///
  /// Example:
  /// ```
  /// String timestamp = PawUtils.getCurrentTimeStamp();
  ///
  /// print(timestamp); // Outputs: "12:30:45" (depending on the current time)
  /// ```
  ///
  static String getCurrentTimeStamp({DateTime? time}) {
    final now = time ?? DateTime.now();

    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  }

  ///
  /// Get the origin file information for the log.
  ///
  /// This function extracts and returns the file information from the provided [stackTrace]
  /// or uses the current stack trace if none is provided.
  ///
  /// Example:
  /// ```
  /// String fileInfo = PawUtils.getSourceFileInfo();
  ///
  /// print(fileInfo); // Outputs: "paw.dart:42" (depending on the actual source file and line number)
  /// ```
  ///
  static String getSourceFileInfo([
    StackTrace? stackTrace,
    bool includeSource = true,
  ]) {
    if (!includeSource) return "";

    stackTrace ??= StackTrace.current;

    final fileInfo = _extractSourceFileInfo(stackTrace);

    return fileInfo;
  }

  ///
  /// Extracts source file information (filename:line) from the provided [stackTrace]
  ///
  /// This function filters out lines related to the PawPrint and PawPawUtils packages
  /// to focus on the source file information.
  ///
  /// **NOTE**: Only to be used in [PawUtils]
  ///
  /// Example:
  /// ```
  /// String fileInfo = _extractSourceFileInfo(StackTrace.current);
  ///
  /// print(fileInfo); // Outputs: "paw.dart:42" (depending on the actual source file and line number)
  /// ```
  ///
  static String _extractSourceFileInfo(StackTrace stackTrace) {
    // extract source file stack trace from the current stack trace
    final String source = stackTrace.toString().split('\n').firstWhere(
          (element) =>
              !element.contains('Paw') &&
              !element.contains(
                'PawUtils',
              ),
          orElse: () => '',
        );

    // if the source file is not found
    if (source.isEmpty) {
      return 'source unknown';
    }

    // Regular expression to extract file name and line number
    RegExp regex = RegExp(r"\((.*?/([^/]+)):([0-9]+):([0-9]+)\)");

    // Match the regular expression in the stack trace
    Match? match = regex.firstMatch(source);

    if (match == null || match.groupCount < 4) {
      return 'source unknown';
    }

    final fileName = match.group(2);

    final lineNumber = int.parse(match.group(3) ?? '00');

    return "$fileName:$lineNumber";
  }

  ///
  /// Get a sanitized and prettified stack trace as a formatted string.
  ///
  /// If [stackTrace] is `null`, an empty string is returned.
  ///
  /// This function formats the stack trace with color highlighting for better readability.
  ///
  /// Example:
  /// ```
  /// String prettyStackTrace = PawUtils.getPrettyStackTrace(StackTrace.current, maxLines: 5);
  /// ```
  ///
  static String getPrettyStackTrace(
    StackTrace? stackTrace, {
    required int maxLines,
  }) {
    try {
      if (stackTrace == null) {
        return '';
      }

      final stackTraceList = stackTrace.toString().split('\n');

      final sanitizedMaxLength =
          stackTraceList.length < maxLines ? stackTraceList.length : maxLines;

      final sanitizedList = stackTraceList.sublist(0, sanitizedMaxLength);

      final coloredSt = sanitizedList
          .map(
            (line) => "${AnsiForegroundColors.lightPink.code}$line",
          )
          .toList()
          .join('\n');

      final bgColor = AnsiBackgroundColor.lightPink.code;
      final fgColor = AnsiForegroundColors.oldBlack.code;
      final styleCode = AnsiTextStyles.italic.code;

      final title = "$bgColor$fgColor$styleCode stacktrace $kAnsiEscapeCode";

      return '$title \n$coloredSt';
    } catch (e) {
      return "$stackTrace [stacktrace error -> $e]";
    }
  }

  ///
  /// Get a prettified error message with color highlighting for better visibility.
  ///
  /// If [error] is `null`, an empty string is returned.
  ///
  /// This function formats the error message with red color highlighting and an italic style.
  ///
  /// Example:
  /// ```
  /// Object? error = FormatException('Invalid input');
  ///
  /// String prettyError = PawUtils.getPrettyError(error);
  ///
  /// print(prettyError); // Outputs: "\x1B[41m\x1B[31;3m error \x1B[0m \x1B[31mInvalid input\x1B[0m"
  /// ```
  ///
  static String getPrettyError(Object? error) {
    if (error == null) {
      return '';
    }

    final bgColor = AnsiBackgroundColor.red.code;
    final fgColor = AnsiForegroundColors.red.code;
    final styleCode = AnsiTextStyles.italic.code;

    final title =
        "$bgColor${AnsiForegroundColors.oldBlack.code}$styleCode error $kAnsiEscapeCode";

    return '$title $fgColor$error\x1B[0m';
  }

  ///
  /// Prettifies an object for debugging purposes using JSON encoding and decoding.
  ///
  /// This function takes an [obj] (object) as input and returns a prettified
  /// string representation of the object. It is useful for printing strings,
  /// lists, or any data structure during debugging.
  ///
  /// Note: This function relies on JSON encoding and decoding to achieve
  /// prettification. It may have limitations on certain types of objects, and
  /// it is recommended to use it primarily for simple data structures.
  ///
  /// Example:
  ///
  /// ```
  /// Object? obj = {'name': 'John', 'age': 25, 'city': 'New York'};
  ///
  /// String prettyObject = PawUtils.getPrettyObject(obj);
  ///
  /// print(prettyObject);
  /// ```
  ///
  static String getPrettyObject(Object? obj) {
    if (obj == null) return "";

    try {
      // Convert the object to a JSON string.
      String jsonString = jsonEncode(obj);

      // Decode and re-encode the JSON with an indentation of 2 spaces.
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');

      String prettyPrintedJson = encoder.convert(json.decode(jsonString));

      // Add color to each line for better visibility.
      List<String> lines = prettyPrintedJson.split('\n');

      lines = lines.map((line) => '\x1b[38;5;15m$line').toList();

      // Join the lines and return the final prettified output.
      String finalOutput = lines.join('\n');
      return finalOutput;
    } catch (e) {
      // Return an error message if any exception occurs during conversion.
      return 'Unable to convert the object. \n${getPrettyError(e)}';
    }
  }

  ///
  /// Prints the log message to the console when the application if [shouldPrintLog]
  /// is set to `true`
  ///
  /// This internal method is used to print the log message to the console using
  /// [print]. The log will be printed only when the [shouldPrintLog] is set to
  /// `true` by the user. This ensures that log messages are displayed only when
  /// user want them to be displayed
  ///
  /// Logs will not be printed if [shouldPrintLog] is set to `false` by user
  ///
  /// Example:
  /// ```
  /// // Prints a plain text log message
  /// PawUtils.log('This is a log message');
  /// ```
  ///
  static void log(String log, {bool shouldPrintLog = true}) {
    if (shouldPrintLog) {
      print(log);
    }
  }
}

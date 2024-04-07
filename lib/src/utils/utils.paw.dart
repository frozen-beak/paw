import 'dart:convert';

import '../colors/ansi.paw.dart';
import '../themes/interface.theme.paw.dart';
import 'log_levels.utils.paw.dart';

///
/// A utility class for [PawPrint]
///
/// This class provides a collection of utility functions for logging,
/// debugging, and formatting messages for better visibility during development.
///
class PawUtils {
  ///
  /// Required title length to fit all the log titles in the same string length
  ///
  /// This brings uniformity in logs across various levels and improve the
  /// readability of the logs.
  ///
  static const kRequiredTitleLength = 5;

  ///
  /// Get decorated log heading for the log with a bold text
  ///
  static String getDecoratedLogHeading(
    PawLogLevels logLevel, {
    required bool shouldPrintName,
    required String name,
    required AnsiBackgroundColor bgColor,
    required PawTheme currentTheme,
  }) {
    final String logTitle = PawUtils.getCorrectSizedTitle(logLevel);

    if (shouldPrintName) {
      return "${bgColor.code}${AnsiTextStyles.bold.code}${currentTheme.heading.code} $name › $logTitle $kAnsiEscapeCode";
    }

    return "${bgColor.code}${AnsiTextStyles.bold.code}${currentTheme.heading.code} $logTitle $kAnsiEscapeCode";
  }

  ///
  /// Get decorated info card with timeStamp and source info
  ///
  static String getDecoratedInfoCard({
    required bool shouldIncludeSourceFileInfo,
    required PawTheme currentTheme,
    StackTrace? stackTrace,
  }) {
    final currentTimeStamp = getCurrentTimeStamp();

    if (!shouldIncludeSourceFileInfo) {
      return "${currentTheme.infoCardBg.code}${currentTheme.heading.code} $currentTimeStamp $kAnsiEscapeCode";
    }

    final String sourceInfo =
        shouldIncludeSourceFileInfo ? getSourceFileInfo(stackTrace) : "";

    return "${currentTheme.infoCardBg.code}${currentTheme.heading.code} $currentTimeStamp › $sourceInfo $kAnsiEscapeCode";
  }

  ///
  /// Get a decorated string with a foreground color and optional text style
  ///
  static String getDecoratedString(
    String message, {
    required AnsiForegroundColors fgColor,
    AnsiTextStyles? textStyle,
  }) {
    return "${fgColor.code}${textStyle != null ? textStyle.code : ""}$message$kAnsiEscapeCode";
  }

  ///
  /// Get the current timestamp in `hh:mm:ss` format.
  ///
  static String getCurrentTimeStamp({DateTime? time}) {
    final now = time ?? DateTime.now();

    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  }

  ///
  /// Get the origin file information for the log.
  ///
  /// This function extracts and returns the file information from the provided
  /// [stackTrace] or uses the current stack trace if none is provided.
  ///
  /// This function filters out lines related to the PawUtils package to focus
  /// on the source file information.
  ///
  static String getSourceFileInfo([
    StackTrace? stackTrace,
    bool includeSource = true,
  ]) {
    if (!includeSource) return "";

    stackTrace ??= StackTrace.current;

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
  /// This function formats the stack trace with color highlighting for better
  /// readability.
  ///
  static String getPrettyStackTrace(
    StackTrace? stackTrace, {
    required int maxLines,
    required PawTheme currentTheme,
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
            (line) => "${currentTheme.object.code}$line",
          )
          .toList()
          .join('\n');

      return coloredSt;
    } catch (e) {
      // Return an error message if any exception occurs during conversion.
      return 'Unable to prettify stacktrace \n${getPrettyError(e, currentTheme: currentTheme)}';
    }
  }

  ///
  /// Prettifies an object for debugging purposes using JSON encoding and decoding.
  ///
  /// This function takes an [object] as input and returns a prettified
  /// string representation of the object. It is useful for printing strings,
  /// lists, or any data structure during debugging.
  ///
  /// Note: This function relies on JSON encoding and decoding to achieve
  /// prettification. It may have limitations on certain types of objects, and
  /// it is recommended to use it primarily for simple data structures.
  ///
  static String getPrettyObject(
    Object? object, {
    required PawTheme currentTheme,
  }) {
    if (object == null) return "";

    try {
      // Convert the object to a JSON string.
      String jsonString = jsonEncode(object);

      // Decode and re-encode the JSON with an indentation of 2 spaces.
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');

      String prettyPrintedJson = encoder.convert(json.decode(jsonString));

      // Add color to each line for better visibility.
      List<String> lines = prettyPrintedJson.split('\n');

      lines = lines.map((line) => '${currentTheme.object.code}$line').toList();

      // Join the lines and return the final prettified output.
      String finalOutput = lines.join('\n');
      return finalOutput;
    } catch (e) {
      // Return an error message if any exception occurs during conversion.
      return 'Unable to convert the object. \n${getPrettyError(e, currentTheme: currentTheme)}';
    }
  }

  ///
  /// Get a prettified error message with color highlighting for better visibility.
  ///
  /// If [error] is `null`, an empty string is returned.
  ///
  static String getPrettyError(Object? error,
      {required PawTheme currentTheme}) {
    if (error == null) {
      return '';
    }

    return '${currentTheme.errorObject.code}$error$kAnsiEscapeCode';
  }

  ///
  /// Prints the log message to the console when the application if
  /// [shouldPrintLog] is set to `true`
  ///
  /// Logs will not be printed if [shouldPrintLog] is set to `false` by user.
  /// This ensures that log messages are displayed only when user want them to
  /// be displayed
  ///
  static void log(String log, {bool shouldPrintLog = true}) {
    if (shouldPrintLog) {
      print(log);
    }
  }

  ///
  /// Adds padding to the log title to fit in with `kRequiredTitleLength`
  ///
  static String getCorrectSizedTitle(PawLogLevels logLevel) {
    final int diff = kRequiredTitleLength - logLevel.title.length;

    return logLevel.title + (" " * diff);
  }
}

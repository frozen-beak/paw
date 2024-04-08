import 'dart:convert';

import 'package:test/test.dart';
import 'package:paw/paw.dart';
import 'package:paw/src/utils/logging.utils.paw.dart';

void main() {
  final currentTheme = PawDarkTheme();

  group('LoggingUtils.getDecoratedLogHeading', () {
    test('getDecoratedLogHeading returns correct string', () {
      final logLevel = PawLogLevels.info;
      final shouldPrintName = true;
      final name = 'MyLogger';
      final bgColor = AnsiBackgroundColor.blue;

      final result = LoggingUtils.getDecoratedLogHeading(
        logLevel,
        shouldPrintName: shouldPrintName,
        name: name,
        bgColor: bgColor,
        currentTheme: currentTheme,
      );

      // Expected result with ANSI codes
      final expected =
          "${bgColor.code}${AnsiTextStyles.bold.code}${currentTheme.heading.code} $name › ${LoggingUtils.getCorrectSizedTitle(logLevel)} $kAnsiEscapeCode";

      expect(result, expected);
    });

    test('getDecoratedLogHeading returns correct string without name', () {
      final logLevel = PawLogLevels.info;
      final shouldPrintName = false;
      final bgColor = AnsiBackgroundColor.blue;

      final result = LoggingUtils.getDecoratedLogHeading(
        logLevel,
        shouldPrintName: shouldPrintName,
        name: 'MyLogger',
        bgColor: bgColor,
        currentTheme: currentTheme,
      );

      // Expected result with ANSI codes
      final expected =
          "${bgColor.code}${AnsiTextStyles.bold.code}${currentTheme.heading.code} ${LoggingUtils.getCorrectSizedTitle(logLevel)} $kAnsiEscapeCode";

      expect(result, expected);
    });
  });

  group('LoggingUtils.getDecoratedInfoCard', () {
    test('getDecoratedInfoCard returns correct string without source info', () {
      final shouldIncludeSourceFileInfo = false;

      final result = LoggingUtils.getDecoratedInfoCard(
        shouldIncludeSourceFileInfo: shouldIncludeSourceFileInfo,
        currentTheme: currentTheme,
        stackTrace: null,
      );

      // Expected result with ANSI codes
      final expected =
          "${currentTheme.infoCardBg.code}${currentTheme.heading.code} ${LoggingUtils.getCurrentTimeStamp()} $kAnsiEscapeCode";

      expect(result, expected);
    });

    test('getDecoratedInfoCard returns correct string with source info', () {
      final shouldIncludeSourceFileInfo = true;
      final stackTrace = StackTrace.current;

      final result = LoggingUtils.getDecoratedInfoCard(
        shouldIncludeSourceFileInfo: shouldIncludeSourceFileInfo,
        currentTheme: currentTheme,
        stackTrace: stackTrace,
      );

      // Expected result with ANSI codes
      final expected =
          "${currentTheme.infoCardBg.code}${currentTheme.heading.code} ${LoggingUtils.getCurrentTimeStamp()} › ${LoggingUtils.getSourceFileInfo(stackTrace)} $kAnsiEscapeCode";

      expect(result, expected);
    });
  });

  group('LoggingUtils.getDecoratedString', () {
    test('getDecoratedString returns correct string with text style', () {
      final message = 'Hello, World!';
      final fgColor = AnsiForegroundColors.black;
      final textStyle = AnsiTextStyles.italic;

      final result = LoggingUtils.getDecoratedString(
        message,
        fgColor: fgColor,
        textStyle: textStyle,
      );

      // Expected result with ANSI codes
      final expected =
          "${fgColor.code}${textStyle.code}$message$kAnsiEscapeCode";

      expect(result, expected);
    });

    test('getDecoratedString returns correct string without text style', () {
      final message = 'Hello, World!';
      final fgColor = AnsiForegroundColors.white;

      final result = LoggingUtils.getDecoratedString(
        message,
        fgColor: fgColor,
        textStyle: null,
      );

      // Expected result with ANSI codes
      final expected = "${fgColor.code}$message$kAnsiEscapeCode";

      expect(result, expected);
    });
  });

  group('LoggingUtils.getCurrentTimeStamp', () {
    test('Correctly formats the timestamp', () {
      DateTime fixedTime = DateTime(2023, 1, 1, 14, 30, 45); // 14:30:45

      String expected = "14:30:45";

      expect(
        LoggingUtils.getCurrentTimeStamp(time: fixedTime),
        equals(expected),
      );
    });
  });

  group('LoggingUtils.getSourceFileInfo', () {
    test('Returns correct file info with provided stack trace', () {
      final stacktrace = StackTrace.fromString("test.dart:10:11");
      expect(LoggingUtils.getSourceFileInfo(stacktrace), isA<String>());
    });

    test('Returns empty string when includeSource is false', () {
      expect(LoggingUtils.getSourceFileInfo(null, false), equals(''));
    });
  });

  group('LoggingUtils.getPrettyStackTrace', () {
    test('Returns empty string for null stack trace', () {
      final stackTrace = LoggingUtils.getPrettyStackTrace(
        null,
        maxLines: 5,
        currentTheme: currentTheme,
      );

      expect(stackTrace, equals(''));
      expect(stackTrace, isNot(endsWith(kAnsiEscapeCode)));
    });
  });

  group('LoggingUtils.getPrettyObject', () {
    test('Prettifies a simple object correctly', () {
      var simpleObject = {'name': 'John', 'age': 25, 'city': 'New York'};
      var expectedOutput = jsonEncode(simpleObject);

      expectedOutput = const JsonEncoder.withIndent('  ').convert(
        json.decode(expectedOutput),
      );

      expectedOutput = expectedOutput
          .split('\n')
          .map((line) => '${PawDarkTheme().object.code}$line')
          .join('\n');

      final prettyObject = LoggingUtils.getPrettyObject(
        simpleObject,
        currentTheme: currentTheme,
      );

      expect(prettyObject, equals(expectedOutput));
    });

    test('Handles null object', () {
      expect(
          LoggingUtils.getPrettyObject(
            null,
            currentTheme: currentTheme,
          ),
          equals(''));
    });
  });

  group('LoggingUtils.getPrettyError', () {
    test('Returns empty string for null error', () {
      final prettyError = LoggingUtils.getPrettyError(
        null,
        currentTheme: currentTheme,
      );

      expect(prettyError, equals(''));
      expect(prettyError, isNot(endsWith(kAnsiEscapeCode)));
    });
  });

  group('LoggingUtils.getCorrectSizedTitle', () {
    test(
      'getCorrectSizedTitle returns correctly sized title',
      () {
        expect(
          LoggingUtils.getCorrectSizedTitle(PawLogLevels.info).length,
          LoggingUtils.kRequiredTitleLength,
        );

        expect(
          LoggingUtils.getCorrectSizedTitle(PawLogLevels.trace).length,
          LoggingUtils.kRequiredTitleLength,
        );

        expect(
          LoggingUtils.getCorrectSizedTitle(PawLogLevels.debug).length,
          LoggingUtils.kRequiredTitleLength,
        );

        expect(
          LoggingUtils.getCorrectSizedTitle(PawLogLevels.warn).length,
          LoggingUtils.kRequiredTitleLength,
        );

        expect(
          LoggingUtils.getCorrectSizedTitle(PawLogLevels.error).length,
          LoggingUtils.kRequiredTitleLength,
        );

        expect(
          LoggingUtils.getCorrectSizedTitle(PawLogLevels.fetal).length,
          LoggingUtils.kRequiredTitleLength,
        );
      },
    );
  });

  group('LoggingUtils.log', () {
    test('LoggingUtils.log returns log message when shouldPrintLog is true',
        () {
      final logMessage = 'Log message';
      final shouldPrintLog = true;

      final result = LoggingUtils.log(
        logMessage,
        shouldPrintLog: shouldPrintLog,
      );

      expect(result, logMessage);
    });

    test('LoggingUtils.log returns null when shouldPrintLog is false', () {
      final logMessage = 'Log message';
      final shouldPrintLog = false;

      final result = LoggingUtils.log(
        logMessage,
        shouldPrintLog: shouldPrintLog,
      );

      expect(result, isNull);
    });
  });
}

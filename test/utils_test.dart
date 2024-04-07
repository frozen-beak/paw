import 'dart:convert';
import 'package:paw/paw.dart';
import 'package:paw/src/ansi/ansi.paw.dart';
import 'package:test/test.dart';

import 'package:paw/src/utils/logging.utils.paw.dart';

void main() {
  final currentTheme = PawDarkTheme();

  group('getCurrentTimeStamp', () {
    test('Correctly formats the timestamp', () {
      DateTime fixedTime = DateTime(2023, 1, 1, 14, 30, 45); // 14:30:45

      String expected = "14:30:45";

      expect(
          LoggingUtils.getCurrentTimeStamp(time: fixedTime), equals(expected));
    });
  });

  group('getSourceFileInfo', () {
    test('Returns correct file info with provided stack trace', () {
      final stacktrace = StackTrace.fromString("test.dart:10:11");
      expect(LoggingUtils.getSourceFileInfo(stacktrace), isA<String>());
    });

    test('Returns empty string when includeSource is false', () {
      expect(LoggingUtils.getSourceFileInfo(null, false), equals(''));
    });
  });

  group('getPrettyStackTrace', () {
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

  group('getPrettyObject', () {
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

  group('getPrettyError', () {
    test('Returns empty string for null error', () {
      final prettyError = LoggingUtils.getPrettyError(
        null,
        currentTheme: currentTheme,
      );

      expect(prettyError, equals(''));
      expect(prettyError, isNot(endsWith(kAnsiEscapeCode)));
    });
  });

  group('getCorrectSizedTitle', () {
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
}

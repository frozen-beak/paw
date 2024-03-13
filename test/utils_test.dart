import 'dart:convert';
import 'package:paw/paw.dart';
import 'package:test/test.dart';

import 'package:paw/src/colors/ansi.paw.dart';
import 'package:paw/src/utils/utils.paw.dart';

void main() {
  final currentTheme = DarkTheme();

  group('getCurrentTimeStamp', () {
    test('Correctly formats the timestamp', () {
      DateTime fixedTime = DateTime(2023, 1, 1, 14, 30, 45); // 14:30:45

      String expected = "14:30:45";

      expect(PawUtils.getCurrentTimeStamp(time: fixedTime), equals(expected));
    });
  });

  group('getSourceFileInfo', () {
    test('Returns correct file info with provided stack trace', () {
      final stacktrace = StackTrace.fromString("test.dart:10:11");
      expect(PawUtils.getSourceFileInfo(stacktrace), isA<String>());
    });

    test('Returns empty string when includeSource is false', () {
      expect(PawUtils.getSourceFileInfo(null, false), equals(''));
    });
  });

  group('getPrettyStackTrace', () {
    test('Returns empty string for null stack trace', () {
      final stackTrace = PawUtils.getPrettyStackTrace(
        null,
        maxLines: 5,
        currentTheme: currentTheme,
      );

      expect(stackTrace, equals(''));
      expect(stackTrace, isNot(endsWith(kAnsiEscapeCode)));
    });
  });

  group('getPrettyError', () {
    test('Returns empty string for null error', () {
      final prettyError = PawUtils.getPrettyError(
        null,
        currentTheme: currentTheme,
      );

      expect(prettyError, equals(''));
      expect(prettyError, isNot(endsWith(kAnsiEscapeCode)));
    });
  });

  group('getPrettyObject tests', () {
    test('Prettifies a simple object correctly', () {
      var simpleObject = {'name': 'John', 'age': 25, 'city': 'New York'};
      var expectedOutput = jsonEncode(simpleObject);

      expectedOutput = const JsonEncoder.withIndent('  ').convert(
        json.decode(expectedOutput),
      );

      expectedOutput = expectedOutput
          .split('\n')
          .map((line) => '\x1b[38;5;15m$line')
          .join('\n');

      final prettyObject = PawUtils.getPrettyObject(
        simpleObject,
        currentTheme: currentTheme,
      );

      expect(prettyObject, equals(expectedOutput));
    });

    test('Handles null object', () {
      expect(
          PawUtils.getPrettyObject(
            null,
            currentTheme: currentTheme,
          ),
          equals(''));
    });
  });
}

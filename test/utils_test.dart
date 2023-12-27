import 'dart:convert';
import 'package:test/test.dart';

import 'package:paw/src/colors/ansi.paw.dart';
import 'package:paw/src/utils/utils.paw.dart';

void main() {
  group('getDecoratedName', () {
    test('Should return an empty string if [shouldPrintName] is false', () {
      final decoratedName = PawUtils.getDecoratedName("Paw", false);

      expect(decoratedName, equals(''));
      expect(decoratedName, isNot(endsWith(escapeCode)));
    });

    test('Should return an empty string if [name] is an empty string', () {
      final decoratedName = PawUtils.getDecoratedName("", true);

      expect(decoratedName, equals(''));
      expect(decoratedName, isNot(endsWith(escapeCode)));
    });

    test(
      'Should return a valid string and name if [shouldPrintName] is true',
      () {
        String name = "Paw";

        final decoratedName = PawUtils.getDecoratedName(name, true);

        expect(decoratedName, isA<String>());
        expect(decoratedName, contains(name));

        expect(decoratedName, endsWith(escapeCode));
      },
    );
  });

  group('getDecoratedString', () {
    test('Should return a valid decorated string', () {
      final decoratedString = PawUtils.getDecoratedString(
        'test message',
        fg: AnsiFgColor.black,
      );

      expect(decoratedString, isA<String>());
      expect(decoratedString, endsWith(escapeCode));
    });
  });

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
      final stackTrace = PawUtils.getPrettyStackTrace(null, maxLines: 5);

      expect(stackTrace, equals(''));
      expect(stackTrace, isNot(endsWith(escapeCode)));
    });
  });

  group('getPrettyError', () {
    test('Returns empty string for null error', () {
      final prettyError = PawUtils.getPrettyError(null);

      expect(prettyError, equals(''));
      expect(prettyError, isNot(endsWith(escapeCode)));
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

      final prettyObject = PawUtils.getPrettyObject(simpleObject);

      expect(prettyObject, equals(expectedOutput));
    });

    test('Handles null object', () {
      expect(PawUtils.getPrettyObject(null), equals(''));
    });
  });
}

import 'dart:convert';

import 'package:paw/src/colors/ansi.paw.dart';
import 'package:test/test.dart';

import 'package:paw/src/utils/utils.paw.dart';

void main() {
  group('getDecoratedName', () {
    test('Should return an empty string if [shouldPrintName] is false', () {
      expect(PawUtils.getDecoratedName("Paw", false), equals(''));
    });

    test('Should return an empty string if [name] is an empty string', () {
      expect(PawUtils.getDecoratedName('', true), equals(''));
    });

    test(
      'Should return a valid string and name if [shouldPrintName] is true',
      () {
        String name = "Paw";

        final decoratedName = PawUtils.getDecoratedName(name, true);

        expect(decoratedName, isA<String>());
        expect(decoratedName, contains(name));
      },
    );
  });

  group('getDecoratedString', () {
    test('Should return a valid decorated string', () {
      expect(
        PawUtils.getDecoratedString('test message', fg: AnsiFgColor.black),
        isA<String>(),
      );
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
      expect(PawUtils.getPrettyStackTrace(null, maxLines: 5), equals(''));
    });
  });

  group('getPrettyError', () {
    test('Returns empty string for null error', () {
      expect(PawUtils.getPrettyError(null), equals(''));
    });
  });

  group('getPrettyObject tests', () {
    test('Prettifies a simple object correctly', () {
      var simpleObject = {'name': 'John', 'age': 25, 'city': 'New York'};
      var expectedOutput = jsonEncode(simpleObject);

      expectedOutput = const JsonEncoder.withIndent('  ')
          .convert(json.decode(expectedOutput));

      expectedOutput = expectedOutput
          .split('\n')
          .map((line) => '\x1b[38;5;15m$line')
          .join('\n');

      expect(PawUtils.getPrettyObject(simpleObject), equals(expectedOutput));
    });

    test('Handles null object', () {
      expect(PawUtils.getPrettyObject(null), equals(''));
    });
  });
}

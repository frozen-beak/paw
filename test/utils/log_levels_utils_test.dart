import 'package:paw/paw.dart';
import 'package:test/test.dart';

void main() {
  group('PawLogLevels', () {
    test('info level title is correct', () {
      expect(PawLogLevels.info.title, 'INFO');
    });

    test('trace level title is correct', () {
      expect(PawLogLevels.trace.title, 'TRACE');
    });

    test('debug level title is correct', () {
      expect(PawLogLevels.debug.title, 'DEBUG');
    });

    test('warn level title is correct', () {
      expect(PawLogLevels.warn.title, 'WARN');
    });

    test('error level title is correct', () {
      expect(PawLogLevels.error.title, 'ERROR');
    });

    test('fetal level title is correct', () {
      expect(PawLogLevels.fetal.title, 'FATAL');
    });
  });
}

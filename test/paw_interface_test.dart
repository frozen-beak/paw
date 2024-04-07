import 'package:test/test.dart';
import 'package:paw/paw.dart';

void main() {
  group('Paw Tests', () {
    late MockLogger paw;

    setUp(() {
      paw = MockLogger();
    });

    test('info should print correctly when shouldPrintLogs is true', () {
      paw.info('Test Info');

      expect(paw.logOutputs.isNotEmpty, isTrue);
      expect(paw.logOutputs.any((log) => log.contains('Test Info')), isTrue);

      paw.clearLogOutputs();
    });

    test('trace should print correctly when shouldPrintLogs is true', () {
      paw.trace('Trace Log');

      expect(paw.logOutputs.isNotEmpty, isTrue);
      expect(paw.logOutputs.any((log) => log.contains('Trace Log')), isTrue);

      paw.clearLogOutputs();
    });

    test('warn should print correctly when shouldPrintLogs is true', () {
      paw.warn('Test Warn');

      expect(paw.logOutputs.isNotEmpty, isTrue);
      expect(paw.logOutputs.any((log) => log.contains('Test Warn')), isTrue);

      paw.clearLogOutputs();
    });

    test('debug should print correctly when shouldPrintLogs is true', () {
      paw.debug('Test Debug');

      expect(paw.logOutputs.isNotEmpty, isTrue);
      expect(paw.logOutputs.any((log) => log.contains('Test Debug')), isTrue);

      paw.clearLogOutputs();
    });

    test('error should print correctly when shouldPrintLogs is true', () {
      try {
        throw Exception('Test Exception');
      } catch (e, stackTrace) {
        paw.error('Test Error', error: e, stackTrace: stackTrace);
      }

      expect(paw.logOutputs.isNotEmpty, isTrue);
      expect(paw.logOutputs.any((log) => log.contains('Test Error')), isTrue);

      paw.clearLogOutputs();
    });

    test('fetal should print correctly when shouldPrintLogs is true', () {
      try {
        throw Exception('Test Exception');
      } catch (e, stackTrace) {
        paw.fetal('Test Error', error: e, stackTrace: stackTrace);
      }

      expect(paw.logOutputs.isNotEmpty, isTrue);
      expect(paw.logOutputs.any((log) => log.contains('Test Error')), isTrue);

      paw.clearLogOutputs();
    });
  });
}

///
/// Mock implementation of Paw for testing
///
class MockLogger extends PawInterface {
  final List<String> logOutputs = [];

  MockLogger({
    super.name = "MockLogger",
    super.maxStackTraces = 3,
    super.shouldIncludeSourceInfo = true,
    super.shouldPrintLogs = true,
    super.shouldPrintName = true,
  }) : super(currentTheme: PawDarkTheme());

  @override
  void info(String msg, {StackTrace? stackTrace}) {
    super.info(msg, stackTrace: stackTrace);

    logOutputs.add(msg);
  }

  @override
  void trace(String msg, {StackTrace? stackTrace}) {
    super.trace(msg, stackTrace: stackTrace);

    logOutputs.add(msg);
  }

  @override
  void warn(String msg, {StackTrace? stackTrace}) {
    super.warn(msg, stackTrace: stackTrace);

    logOutputs.add(msg);
  }

  @override
  void debug(Object obj, {StackTrace? stackTrace}) {
    super.debug(obj, stackTrace: stackTrace);

    logOutputs.add(obj.toString());
  }

  @override
  void error(String msg, {Object? error, StackTrace? stackTrace}) {
    super.error(msg, error: error, stackTrace: stackTrace);

    logOutputs.add(msg);
  }

  @override
  void fetal(String msg, {Object? error, StackTrace? stackTrace}) {
    super.fetal(msg, error: error, stackTrace: stackTrace);

    logOutputs.add(msg);
  }

  void clearLogOutputs() {
    logOutputs.clear();
  }
}

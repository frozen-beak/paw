import 'package:paw/paw.dart';
import 'package:test/test.dart';

void main() {
  group('PawThemes', () {
    test('All properties of PawDarkTheme are implemented', () {
      final theme = PawDarkTheme();

      expect(() => theme.heading, isNot(throwsException));
      expect(() => theme.message, isNot(throwsException));
      expect(() => theme.object, isNot(throwsException));

      expect(() => theme.errorMessage, isNot(throwsException));
      expect(() => theme.errorObject, isNot(throwsException));

      expect(() => theme.bgDebug, isNot(throwsException));
      expect(() => theme.bgError, isNot(throwsException));
      expect(() => theme.bgFetal, isNot(throwsException));
      expect(() => theme.bgInfo, isNot(throwsException));
      expect(() => theme.bgTrace, isNot(throwsException));
      expect(() => theme.bgWarn, isNot(throwsException));

      expect(() => theme.infoCardBg, isNot(throwsException));
    });

    test('All properties of PawLightTheme are implemented', () {
      final theme = PawLightTheme();

      expect(() => theme.heading, isNot(throwsException));
      expect(() => theme.message, isNot(throwsException));
      expect(() => theme.object, isNot(throwsException));

      expect(() => theme.errorMessage, isNot(throwsException));
      expect(() => theme.errorObject, isNot(throwsException));

      expect(() => theme.bgDebug, isNot(throwsException));
      expect(() => theme.bgError, isNot(throwsException));
      expect(() => theme.bgFetal, isNot(throwsException));
      expect(() => theme.bgInfo, isNot(throwsException));
      expect(() => theme.bgTrace, isNot(throwsException));
      expect(() => theme.bgWarn, isNot(throwsException));

      expect(() => theme.infoCardBg, isNot(throwsException));
    });
  });
}

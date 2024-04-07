import 'package:paw/paw.dart';
import 'package:test/test.dart';

void main() {
  group(
    'PawCustomTheme',
    () {
      test(
        'All properties of PawCustomTheme are initialized and return expected values',
        () {
          final theme = PawCustomTheme(
            heading: AnsiForegroundColors.white,
            message: AnsiForegroundColors.softPink,
            object: AnsiForegroundColors.lightPurple,
            errorMessage: AnsiForegroundColors.orange,
            errorObject: AnsiForegroundColors.red,
            bgWarn: AnsiBackgroundColor.pink,
            bgInfo: AnsiBackgroundColor.blue,
            bgTrace: AnsiBackgroundColor.green,
            bgDebug: AnsiBackgroundColor.darkGray,
            bgError: AnsiBackgroundColor.darkPink,
            bgFetal: AnsiBackgroundColor.brown,
            infoCardBg: AnsiBackgroundColor.lightGray,
          );

          expect(theme.heading, AnsiForegroundColors.white);
          expect(theme.message, AnsiForegroundColors.softPink);
          expect(theme.object, AnsiForegroundColors.lightPurple);

          expect(theme.errorMessage, AnsiForegroundColors.orange);
          expect(theme.errorObject, AnsiForegroundColors.red);

          expect(theme.bgWarn, AnsiBackgroundColor.pink);
          expect(theme.bgInfo, AnsiBackgroundColor.blue);
          expect(theme.bgTrace, AnsiBackgroundColor.green);
          expect(theme.bgDebug, AnsiBackgroundColor.darkGray);
          expect(theme.bgError, AnsiBackgroundColor.darkPink);
          expect(theme.bgFetal, AnsiBackgroundColor.brown);

          expect(theme.infoCardBg, AnsiBackgroundColor.lightGray);
        },
      );
    },
  );
}

import '../ansi/colors.ansi.paw.dart';
import 'interface.themes.paw.dart';

///
/// A custom theme preset to customize Paw logging with a dark theme
///
class PawDarkTheme extends PawTheme {
  // text colors

  @override
  AnsiForegroundColors get heading => AnsiForegroundColors.white;

  @override
  AnsiForegroundColors get message => AnsiForegroundColors.softPink;

  @override
  AnsiForegroundColors get object => AnsiForegroundColors.lightPurple;

  // accent colors

  @override
  AnsiForegroundColors get errorMessage => AnsiForegroundColors.orange;

  @override
  AnsiForegroundColors get errorObject => AnsiForegroundColors.red;

  // background colors

  @override
  AnsiBackgroundColor get bgDebug => AnsiBackgroundColor.darkGray;

  @override
  AnsiBackgroundColor get bgError => AnsiBackgroundColor.darkPink;

  @override
  AnsiBackgroundColor get bgFetal => AnsiBackgroundColor.brown;

  @override
  AnsiBackgroundColor get bgInfo => AnsiBackgroundColor.blue;

  @override
  AnsiBackgroundColor get bgTrace => AnsiBackgroundColor.green;

  @override
  AnsiBackgroundColor get bgWarn => AnsiBackgroundColor.pink;

  @override
  AnsiBackgroundColor get infoCardBg => AnsiBackgroundColor.lightGray;
}

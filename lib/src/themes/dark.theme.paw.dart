import '../colors/ansi.paw.dart';
import 'core/interface.theme.paw.dart';

///
/// A custom theme preset to customize Paw logging with a dark theme
///
class DarkTheme extends PawTheme {
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
  AnsiBackgroundColor get bgDebug => AnsiBackgroundColor.gray;

  @override
  AnsiBackgroundColor get bgError => AnsiBackgroundColor.darkPink;

  @override
  AnsiBackgroundColor get bgFetal => AnsiBackgroundColor.maroon;

  @override
  AnsiBackgroundColor get bgInfo => AnsiBackgroundColor.blue;

  @override
  AnsiBackgroundColor get bgTrace => AnsiBackgroundColor.green;

  @override
  AnsiBackgroundColor get bgWarn => AnsiBackgroundColor.pink;

  @override
  AnsiBackgroundColor get infoCardBg => AnsiBackgroundColor.lightGray;
}

/**
 * 
 * ANSI Color Codes to beautify Logging
 * 
 * Paw try to provide a simple and effective way to apply ANSI color codes 
 * and styles to text in terminal or console applications. These ANSI codes are 
 * special character sequences that control the formatting, such as color and 
 * style, of text displayed in environments that support ANSI escape codes. 
 * 
 * For more comprehensive details on ANSI colors, you can visit: 
 * [ANSI Colors Documentation](https://en.wikipedia.org/wiki/ANSI_escape_code) 
 * 
 * To explore more ANSI color options, refer to: 
 * [Various ANSI Color Codes](https://talyian.github.io/ansicolors/)
 * 
 */

///
/// A global constant ANSI Escape Code for Resetting Style
///
/// This constant represents the ANSI escape code used to reset the text
/// formatting to its default state. It's analogous to an 'end tag' in HTML,
/// ensuring that any style changes are contained only within the intended scope.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiForegroundColors.red.code} This is red text $kAnsiEscapeCode");
/// ```
///
/// In this example, escape code is used to ensure that the red text color does
/// not apply to any subsequent text.
///
const String kAnsiEscapeCode = "\x1B[0m";

///
/// ANSI Foreground Color Codes
///
/// This enum provides a set of predefined foreground colors using ANSI codes.
/// These can be easily used to change the color of text in console output.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiForegroundColors.black.code} This is black text $kAnsiEscapeCode");
/// ```
///
/// Here, `AnsiForegroundColors.black.code` is used to set the text color to black.
///
enum AnsiForegroundColors {
  ///
  /// Black foreground color representing `rgb(0,0,0)`
  ///
  black("\x1b[38;5;0m"),

  ///
  /// White foreground color representing `rgb(255,255,255)`
  ///
  white("\x1b[38;5;255m"),

  ///
  /// Soft Pink foreground color representing `rgb(255, 95, 135)`
  ///
  softPink("\x1b[38;5;195m"),

  ///
  /// Light Purple foreground color representing `rgb(155, 89, 182)`
  ///
  lightPurple("\x1b[38;5;189m"),

  ///
  /// Orange foreground color representing `rgb(255, 135, 0)`
  ///
  orange("\x1b[38;5;208m"),

  ///
  /// Red foreground color representing `rgb(204, 0, 0)`
  ///
  red("\x1b[38;5;9m");

  ///
  /// Constructor for defining a foreground color code.
  ///
  /// [code] represents the specific ANSI escape code for the foreground color.
  ///
  const AnsiForegroundColors(this.code);

  ///
  /// The ANSI escape code for the color.
  ///
  /// Example:
  /// ```
  /// // Using AnsiForegroundColors to set the text color to yellow
  /// debugPrint("${AnsiForegroundColors.yellow.code} This is yellow text ${kAnsiEscapeCode}");
  /// ```
  ///
  final String code;
}

///
/// Ansi Background Color Codes
///
/// This enum provides a set of predefined background colors using ANSI codes.
/// These can be easily used to change the background color of text in console
/// output.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiBackgroundColor.blue.code} This text has a blue background $kAnsiEscapeCode");
/// ```
///
/// Here, `AnsiBackgroundColor.blue.code` sets the background color to blue.
///
enum AnsiBackgroundColor {
  ///
  /// Pink background color representing `rgb(255, 102, 204)`
  ///
  pink("\x1b[48;5;204m"),

  ///
  /// Blue background color representing `rgb(0, 0, 139)`
  ///
  blue("\x1b[48;5;4m"),

  ///
  /// Green background color representing `rgb(0, 139, 0)`
  ///
  green("\x1b[48;5;36m"),

  ///
  /// Light Gray background color representing `rgb(192, 192, 192)`
  ///
  lightGray("\x1b[48;5;240m"),

  ///
  /// Dark Pink background color representing `rgb(255, 61, 111)`
  ///
  darkPink("\x1b[48;5;203m"),

  ///
  /// Maroon background color representing `rgb(128, 0, 0)`
  ///
  maroon("\x1b[48;5;1m"),

  ///
  /// Gray background color representing `rgb(173, 173, 173)`
  ///
  gray("\x1b[48;5;238m");

  ///
  /// Constructor for defining a background color code.
  ///
  /// [code] represents the specific ANSI escape code for the background color.
  ///
  const AnsiBackgroundColor(this.code);

  ///
  /// The ANSI escape code for the background color.
  ///
  /// Example:
  /// ```
  /// // Using AnsiBgColor to set the background color to blue
  /// debugPrint("${AnsiBgColor.blue.code} This has a blue background ${kAnsiEscapeCode}");
  /// ```
  ///
  final String code;
}

///
/// Ansi Text Style Codes
///
/// This enum provides text styling options using ANSI codes, such as making
/// text italic, bold, etc.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiTextStyles.italic.code} This is italicized text ${kAnsiEscapeCode}");
/// ```
///
/// In this example, `AnsiTextStyles.italic.code` is used to make the text italic.
///
enum AnsiTextStyles {
  ///
  /// Italic style ANSI code
  ///
  italic("\x1b[3m"),

  ///
  /// Bold style ANSI code
  ///
  bold("\x1b[1m");

  ///
  /// Constructor for defining a text style code.
  ///
  /// [code] represents the specific ANSI escape code for the text style.
  ///
  const AnsiTextStyles(this.code);

  ///
  /// The ANSI escape code for the text style.
  ///
  /// Example:
  /// ```
  /// // Using AnsiStyle to make text italic
  /// debugPrint("${AnsiStyle.italic.code} This is italicized text ${kAnsiEscapeCode}");
  /// ```
  ///
  final String code;
}

/// ANSI color codes, also known as ANSI escape codes,
/// are special sequences of characters used to control
/// the formatting and color of text displayed on terminals or
/// consoles that support ANSI escape codes.
///
/// For more information on ANSI colors, refer to:
/// [ANSI Colors Documentation](https://en.wikipedia.org/wiki/ANSI_escape_code)
///
/// To explore more ANSI colors, refer to:
/// [Various ANSI Color Codes](https://talyian.github.io/ansicolors/)

///
/// ANSI escape code to add at the end of every line
/// This works like an ending tag in HTML which closes the tag.
///
/// Example:
/// ```
/// // Using AnsiFgColor to set the text color to red
/// debugPrint("${AnsiFgColor.red.code} This is red text ${escapeCode}");
/// ```
/// The escape code ensures that the color change does not affect subsequent text
///
const String escapeCode = "\x1B[0m";

///
/// Ansi Foreground Color Codes
///
enum AnsiFgColor {
  black("\x1B[30m"),
  white("\x1b[38;5;15m"),
  yellow("\x1b[38;5;11m"),
  pink("\x1b[38;5;213m"),
  orange("\x1b[38;5;214m"),
  red("\x1b[38;5;196m"),
  lightPink("\x1b[38;5;225m");

  const AnsiFgColor(this.code);

  /// Example:
  /// ```
  /// // Using AnsiFgColor to set the text color to yellow
  /// debugPrint("${AnsiFgColor.yellow.code} This is yellow text ${escapeCode}");
  /// ```
  final String code;
}

///
/// Ansi Background Color Codes
///
enum AnsiBgColor {
  white("\x1b[48;5;15m"),
  blue("\x1b[48;5;33m"),
  yellow("\x1b[48;5;11m"),
  pink("\x1b[48;5;200m"),
  red("\x1b[48;5;196m"),
  orange("\x1b[48;5;208m"),
  lightPink("\x1b[48;5;225m");

  const AnsiBgColor(this.code);

  /// Example:
  /// ```
  /// // Using AnsiBgColor to set the background color to blue
  /// debugPrint("${AnsiBgColor.blue.code} This has a blue background ${escapeCode}");
  /// ```
  final String code;
}

///
/// Ansi Text Styles
///
enum AnsiStyle {
  italic("\x1b[3m");

  const AnsiStyle(this.code);

  /// Example:
  /// ```
  /// // Using AnsiStyle to make text italic
  /// debugPrint("${AnsiStyle.italic.code} This is italicized text ${escapeCode}");
  /// ```
  final String code;
}

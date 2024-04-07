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

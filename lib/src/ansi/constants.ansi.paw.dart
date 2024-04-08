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

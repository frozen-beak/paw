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
class AnsiForegroundColors {
  ///
  /// The ANSI escape code for the color.
  ///
  /// ### Example:
  /// ```
  /// // Using AnsiForegroundColors to set the text color to yellow
  /// debugPrint("${AnsiForegroundColors.yellow.code} This is yellow text ${kAnsiEscapeCode}");
  /// ```
  ///
  final String code;

  ///
  /// Constructor for defining a foreground color code.
  ///
  /// [code] represents the specific ANSI escape code for the foreground color.
  ///
  const AnsiForegroundColors(this.code);

  ///
  /// Factory constructor for creating a custom [AnsiForegroundColors] using
  /// RGB values
  ///
  /// The [r], [g], and [b] parameters represent the red, green, and blue
  /// components of the color, respectively. Each component should be an integer
  /// between 0 and 255, inclusive.
  ///
  /// 👉 Note: These function contains assert statements to validate RGB values,
  /// ensuring they are between 0 and 255. They are effective in the development
  /// environment only and won't impact production code.
  ///
  /// ### Example:
  /// ```
  /// final customColor = AnsiForegroundColors.custom(r: 123, g: 45, b: 67);
  /// ```
  ///
  factory AnsiForegroundColors.custom({
    required int r,
    required int g,
    required int b,
  }) {
    /**
     * Note: These assert statements validate RGB values, ensuring they are 
     * between 0 and 255. They are effective in the development environment only 
     * and won't impact production code. 
    */

    assert(
      r <= 255 && r >= 0,
      "The red (r) component in RGB should be between 0 and 255",
    );

    assert(
      g <= 255 && g >= 0,
      "The green (g) component in RGB should be between 0 and 255",
    );

    assert(
      b <= 255 && b >= 0,
      "The blue (b) component in RGB should be between 0 and 255",
    );

    return AnsiForegroundColors("\x1b[38;2;$r;$g;${b}m");
  }

  ///
  /// Black foreground color representing `rgb(0,0,0)`
  ///
  static const AnsiForegroundColors black = AnsiForegroundColors(
    "\x1b[38;5;0m",
  );

  ///
  /// NavyBlue foreground color representing `rgb(??)`
  ///
  static const AnsiForegroundColors navyBlue = AnsiForegroundColors(
    "\x1b[38;5;18m",
  );

  ///
  /// Gray foreground color representing `rgb(??)`
  ///
  static const AnsiForegroundColors gray = AnsiForegroundColors(
    "\x1b[38;5;8m",
  );

  ///
  /// White foreground color representing `rgb(255,255,255)`
  ///
  static const AnsiForegroundColors white = AnsiForegroundColors(
    "\x1b[38;5;255m",
  );

  ///
  /// Soft Pink foreground color representing `rgb(255, 95, 135)`
  ///
  static const AnsiForegroundColors softPink = AnsiForegroundColors(
    "\x1b[38;5;195m",
  );

  ///
  /// Light Purple foreground color representing `rgb(155, 89, 182)`
  ///
  static const AnsiForegroundColors lightPurple = AnsiForegroundColors(
    "\x1b[38;5;189m",
  );

  ///
  /// Orange foreground color representing `rgb(255, 135, 0)`
  ///
  static const AnsiForegroundColors orange = AnsiForegroundColors(
    "\x1b[38;5;208m",
  );

  ///
  /// Red foreground color representing `rgb(204, 0, 0)`
  ///
  static const AnsiForegroundColors red = AnsiForegroundColors(
    "\x1b[38;5;9m",
  );
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
class AnsiBackgroundColor {
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

  ///
  /// Constructor for defining a background color code.
  ///
  /// [code] represents the specific ANSI escape code for the background color.
  ///
  const AnsiBackgroundColor(this.code);

  ///
  /// Factory constructor for creating a custom [AnsiBackgroundColor] using
  /// RGB values
  ///
  /// The [r], [g], and [b] parameters represent the red, green, and blue
  /// components of the color, respectively. Each component should be an integer
  /// between 0 and 255, inclusive.
  ///
  /// 👉 Note: These function contains assert statements to validate RGB values,
  /// ensuring they are between 0 and 255. They are effective in the development
  /// environment only and won't impact production code.
  ///
  /// ### Example:
  /// ```
  /// final customColor = AnsiBackgroundColor.custom(r: 123, g: 45, b: 67);
  /// ```
  ///
  factory AnsiBackgroundColor.custom({
    required int r,
    required int g,
    required int b,
  }) {
    /**
     * Note: These assert statements validate RGB values, ensuring they are 
     * between 0 and 255. They are effective in the development environment only 
     * and won't impact production code. 
    */

    assert(
      r <= 255 && r >= 0,
      "The red (r) component in RGB should be between 0 and 255",
    );

    assert(
      g <= 255 && g >= 0,
      "The green (g) component in RGB should be between 0 and 255",
    );

    assert(
      b <= 255 && b >= 0,
      "The blue (b) component in RGB should be between 0 and 255",
    );

    return AnsiBackgroundColor("\x1b[48;2;$r;$g;${b}m");
  }

  ///
  /// Pink background color representing `rgb(255, 102, 204)`
  ///
  static const AnsiBackgroundColor pink = AnsiBackgroundColor(
    "\x1b[48;5;204m",
  );

  ///
  /// Blue background color representing `rgb(0, 0, 139)`
  ///
  static const AnsiBackgroundColor blue = AnsiBackgroundColor(
    "\x1b[48;5;4m",
  );

  ///
  /// Green background color representing `rgb(0, 139, 0)`
  ///
  static const AnsiBackgroundColor green = AnsiBackgroundColor(
    "\x1b[48;5;36m",
  );

  ///
  /// Light Gray background color representing `rgb(192, 192, 192)`
  ///
  static const AnsiBackgroundColor lightGray = AnsiBackgroundColor(
    "\x1b[48;5;240m",
  );

  ///
  /// Dark Pink background color representing `rgb(255, 61, 111)`
  ///
  static const AnsiBackgroundColor darkPink = AnsiBackgroundColor(
    "\x1b[48;5;203m",
  );

  ///
  /// Brown background color representing `rgb(??)`
  ///
  static const AnsiBackgroundColor brown = AnsiBackgroundColor(
    "\x1b[48;5;124m",
  );

  ///
  /// DarkGray background color representing `rgb(173, 173, 173)`
  ///
  static const AnsiBackgroundColor darkGray = AnsiBackgroundColor(
    "\x1b[48;5;238m",
  );

  ///
  /// Gray background color representing `rgb(??)`
  ///
  static const AnsiBackgroundColor gray = AnsiBackgroundColor(
    "\x1b[48;5;245m",
  );
}

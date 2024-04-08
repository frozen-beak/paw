import '../ansi/colors.ansi.paw.dart';

///
/// `PawTheme` - An abstract class to help create custom themes to
/// customize Paw
///
abstract class PawTheme {
  // text colors

  ///
  /// A foreground color to represent the primary text in the log, such as
  /// log level heading, source file info, timing, etc.
  ///
  AnsiForegroundColors get heading;

  ///
  /// A foreground color to represent the secondary text in the log, this is
  /// the message that is being printed with the log
  ///
  AnsiForegroundColors get message;

  ///
  /// A foreground color to represent the tertiary text in the log, such as
  /// stacktrace, debugging object, etc.
  ///
  AnsiForegroundColors get object;

  // accent colors

  ///
  /// A foreground color to represent the error message in the log
  ///
  AnsiForegroundColors get errorMessage;

  ///
  /// A foreground color to represent the error object in the log
  ///
  AnsiForegroundColors get errorObject;

  // bg colors

  ///
  /// A background color for the WARN log
  ///
  AnsiBackgroundColor get bgWarn;

  ///
  /// A background color for the INFO log
  ///
  AnsiBackgroundColor get bgInfo;

  ///
  /// A background color for the TRACE log
  ///
  AnsiBackgroundColor get bgTrace;

  ///
  /// A background color for the DEBUG log
  ///
  AnsiBackgroundColor get bgDebug;

  ///
  /// A background color for the ERROR log
  ///
  AnsiBackgroundColor get bgError;

  ///
  /// A background color for the FETAL log
  ///
  AnsiBackgroundColor get bgFetal;

  ///
  /// A background color for info card,
  ///
  /// Info card include info like source file info and time of the log
  ///
  AnsiBackgroundColor get infoCardBg;
}

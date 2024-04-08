import '../ansi/ansi.paw.dart';
import 'interface.themes.paw.dart';

class PawCustomTheme extends PawTheme {
  ///
  /// A foreground color to represent the primary text in the log, such as
  /// log level heading, source file info, timing, etc.
  ///
  final AnsiForegroundColors _heading;

  ///
  /// A foreground color to represent the secondary text in the log, this is
  /// the message that is being printed with the log
  ///
  final AnsiForegroundColors _message;

  ///
  /// A foreground color to represent the tertiary text in the log, such as
  /// stacktrace, debugging object, etc.
  ///
  final AnsiForegroundColors _object;

  ///
  /// A foreground color to represent the error message in the log
  ///
  final AnsiForegroundColors _errorMessage;

  ///
  /// A foreground color to represent the error object in the log
  ///
  final AnsiForegroundColors _errorObject;

  ///
  /// A background color for the WARN log
  ///
  final AnsiBackgroundColor _bgWarn;

  ///
  /// A background color for the INFO log
  ///
  final AnsiBackgroundColor _bgInfo;

  ///
  /// A background color for the TRACE log
  ///
  final AnsiBackgroundColor _bgTrace;

  ///
  /// A background color for the DEBUG log
  ///
  final AnsiBackgroundColor _bgDebug;

  ///
  /// A background color for the ERROR log
  ///
  final AnsiBackgroundColor _bgError;

  ///
  /// A background color for the FETAL log
  ///
  final AnsiBackgroundColor _bgFetal;

  ///
  /// A background color for info card,
  ///
  /// Info card include info like source file info and time of the log
  ///
  final AnsiBackgroundColor _infoCardBg;

  PawCustomTheme({
    required AnsiForegroundColors heading,
    required AnsiForegroundColors message,
    required AnsiForegroundColors object,
    required AnsiForegroundColors errorMessage,
    required AnsiForegroundColors errorObject,
    required AnsiBackgroundColor bgWarn,
    required AnsiBackgroundColor bgInfo,
    required AnsiBackgroundColor bgTrace,
    required AnsiBackgroundColor bgDebug,
    required AnsiBackgroundColor bgError,
    required AnsiBackgroundColor bgFetal,
    required AnsiBackgroundColor infoCardBg,
  })  : _bgDebug = bgDebug,
        _bgError = bgError,
        _bgFetal = bgFetal,
        _bgInfo = bgInfo,
        _bgTrace = bgTrace,
        _bgWarn = bgWarn,
        _errorMessage = errorMessage,
        _errorObject = errorObject,
        _heading = heading,
        _infoCardBg = infoCardBg,
        _message = message,
        _object = object;

  @override
  AnsiBackgroundColor get bgDebug => _bgDebug;

  @override
  AnsiBackgroundColor get bgError => _bgError;

  @override
  AnsiBackgroundColor get bgFetal => _bgFetal;

  @override
  AnsiBackgroundColor get bgInfo => _bgInfo;

  @override
  AnsiBackgroundColor get bgTrace => _bgTrace;

  @override
  AnsiBackgroundColor get bgWarn => _bgWarn;

  @override
  AnsiForegroundColors get errorMessage => _errorMessage;

  @override
  AnsiForegroundColors get errorObject => _errorObject;

  @override
  AnsiForegroundColors get heading => _heading;

  @override
  AnsiBackgroundColor get infoCardBg => _infoCardBg;

  @override
  AnsiForegroundColors get message => _message;

  @override
  AnsiForegroundColors get object => _object;
}

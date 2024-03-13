///
/// Enum to represent available logging levels in Paw
///
/// This enum provides a set of predefined logging levels available in Paw, each
/// level has a `title` associated with it to print on the console.
///
/// ### Example:
/// ```
/// debugPrint(PawLogLevels.info.title);
/// ```
///
enum PawLogLevels {
  ///
  /// Log informational messages. Ideal for general app behaviors and states.
  ///
  info("INFO"),

  ///
  /// Log detailed tracing information. Ideal for high-volume logs.
  ///
  trace("TRACE"),

  ///
  /// Log debugging information. Essential for troubleshooting and understanding complex flows.
  ///
  debug("DEBUG"),

  ///
  /// Log warnings. Use this for non-critical issues that should be noted.
  ///
  warn("WARN"),

  ///
  /// Log an error with an error object to help debug.
  ///
  error("ERROR"),

  ///
  /// Log errors with detailed information, including error objects and stack
  /// traces. Critical for error tracking.
  ///
  fetal("FATAL");

  ///
  /// Constructor for defining the title for the log level.
  ///
  /// [title] represents the title of the log level which is printed on the console.
  ///
  const PawLogLevels(this.title);

  ///
  /// The title for the logging level to print.
  ///
  /// ### Example:
  /// ```
  /// debugPrint(PawLogLevels.info.title);
  /// ```
  ///
  final String title;
}

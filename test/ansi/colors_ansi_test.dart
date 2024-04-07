import 'package:paw/paw.dart';
import 'package:test/test.dart';

void main() {
  group("AnsiForegroundColors", () {
    test(
      'AnsiForegroundColors.custom function creates color with valid RGB values',
      () {
        // Arrange
        final r = 123;
        final g = 45;
        final b = 67;

        final customColor = AnsiForegroundColors.custom(r: r, g: g, b: b);

        expect(customColor.code, '\x1b[38;2;$r;$g;${b}m');
      },
    );

    test(
        'AnsiForegroundColors.custom function throws AssertionError for invalid RGB values',
        () {
      // Invalid Red (r) component value
      final r = 256;

      // Invalid Green (g) component value
      final g = 280;

      // Invalid Blue (b) component value
      final b = -20;

      // Should throw assertion error as provided Red (r) component value is invalid
      expect(
        () => AnsiForegroundColors.custom(r: r, g: 0, b: 0),
        throwsA(isA<AssertionError>()),
      );

      // Should throw assertion error as provided Green (g) component value is invalid
      expect(
        () => AnsiForegroundColors.custom(r: 0, g: g, b: 0),
        throwsA(isA<AssertionError>()),
      );

      // Should throw assertion error as provided Blue (b) component value is invalid
      expect(
        () => AnsiForegroundColors.custom(r: 0, g: 0, b: b),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group("AnsiBackgroundColor", () {
    test(
      'AnsiBackgroundColor.custom function creates color with valid RGB values',
      () {
        // Arrange
        final r = 123;
        final g = 45;
        final b = 67;

        // Act
        final customColor = AnsiBackgroundColor.custom(r: r, g: g, b: b);

        // Assert
        expect(customColor.code, '\x1b[48;2;$r;$g;${b}m');
      },
    );

    test(
        'AnsiBackgroundColor.custom function creates throws AssertionError for invalid RGB values',
        () {
      // Invalid Red (r) component value
      final r = 256;

      // Invalid Green (g) component value
      final g = 280;

      // Invalid Blue (b) component value
      final b = -20;

      // Should throw assertion error as provided Red (r) component value is invalid
      expect(
        () => AnsiBackgroundColor.custom(r: r, g: 0, b: 0),
        throwsA(isA<AssertionError>()),
      );

      // Should throw assertion error as provided Green (g) component value is invalid
      expect(
        () => AnsiBackgroundColor.custom(r: 0, g: g, b: 0),
        throwsA(isA<AssertionError>()),
      );

      // Should throw assertion error as provided Blue (b) component value is invalid
      expect(
        () => AnsiBackgroundColor.custom(r: 0, g: 0, b: b),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}

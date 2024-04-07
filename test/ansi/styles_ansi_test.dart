import "package:paw/paw.dart";
import "package:test/test.dart";

void main() {
  group("AnsiTextStyles", () {
    test('AnsiTextStyles.italic code is correct', () {
      expect(AnsiTextStyles.italic.code, '\x1b[3m');
    });

    test('AnsiTextStyles.bold code is correct', () {
      expect(AnsiTextStyles.bold.code, '\x1b[1m');
    });
  });
}

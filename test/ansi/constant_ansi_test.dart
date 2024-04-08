import "package:paw/paw.dart";
import "package:test/test.dart";

void main() {
  group("AnsiConstant", () {
    test('kAnsiEscapeCode constant value is correct', () {
      expect(kAnsiEscapeCode, '\x1B[0m');
    });
  });
}

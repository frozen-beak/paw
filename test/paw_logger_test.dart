import 'package:test/test.dart';
import 'package:paw/paw.dart';

void main() {
  group('Paw Logger', () {
    late Paw paw;

    // Test default behavior
    test('Default settings are applied correctly', () {
      paw = Paw();

      // Check default values
      expect(paw.title, equals("Paw"));
      expect(paw.stackTraceToPrint, equals(5));
      expect(paw.shouldIncludeTitle, isTrue);
      expect(paw.shouldPrint, isTrue);
      expect(paw.shouldIncludeSourceFileInfo, isTrue);
    });

    // Test custom settings
    test('Custom settings are applied correctly', () {
      paw = Paw(
        title: "Paw",
        stackTraceToPrint: 3,
        shouldIncludeTitle: false,
        shouldPrint: false,
        shouldIncludeSourceFileInfo: false,
      );

      expect(paw.title, equals("Paw"));
      expect(paw.stackTraceToPrint, equals(3));
      expect(paw.shouldIncludeTitle, isFalse);
      expect(paw.shouldPrint, isFalse);
      expect(paw.shouldIncludeSourceFileInfo, isFalse);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:numerix/numerix.dart';

void main() {
  group('Numerix formatting tests', () {
    final numerix = Numerix(
      languageCode: 'en',
      decimalSeparator: '.',
      thousandSeparator: ',',
      compactDecimalPlaces: 2,
    );

    test('formatWithSeparators formats correctly', () {
      expect(numerix.formatWithSeparators(1234567.89), '1,234,567.89');
      expect(numerix.formatWithSeparators(1000), '1,000.00');
    });

    test('formatCompact formats correctly', () {
      expect(numerix.formatCompact(1500), '1.50K');
      expect(numerix.formatCompact(2000000), '2.00M');
      expect(numerix.formatCompact(500), '500');
    });

    test('formatOrdinal formats correctly', () {
      expect(numerix.formatOrdinal(1), '1st');
      expect(numerix.formatOrdinal(2), '2nd');
      expect(numerix.formatOrdinal(3), '3rd');
      expect(numerix.formatOrdinal(4), '4th');
      expect(numerix.formatOrdinal(11), '11th');
      expect(numerix.formatOrdinal(21), '21st');
    });

    test('supports different locales suffixes', () {
      final numerixFr = Numerix(languageCode: 'fr');
      expect(numerixFr.formatCompact(1500), '1.5k'); // French 'k'

      final numerixId = Numerix(languageCode: 'id');
      expect(numerixId.formatCompact(1500), '1.5rb'); // Indonesian 'rb'
    });
  });
}

# NumeriX

A cross-platform number formatting package with localization, compact mode, ordinal support, and more — by PT. Nicxon International Solutions.

NumeriX makes formatting numbers in different languages and styles easy, including:

- Thousand and decimal separators
- Compact notation (e.g., 1.2K, 3.4M)
- Ordinal formatting (1st, 2nd, 3rd, etc.)
- Currency formatting
- Percentage formatting
- Roman numerals
- Fractional numbers
- Byte size formatting
- Duration formatting
- Digit localization (e.g., Persian/Arabic digits)

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  numerix: ^1.0.0
```

Then run:

```agsl
flutter pub get
```

## Usage

### Creating a NumeriX instance with custom language and separators

```dart
final _numerix = Numerix(
  languageCode: 'fr',            // Language code for localization
  decimalSeparator: ',',         // Decimal separator character
  thousandSeparator: '.',        // Thousand separator character
  compactDecimalPlaces: 1,       // Number of decimal places in compact formatting
);
```

### Example: Basic formatting

```agsl
final number = 1234567.89;

print(_numerix.formatWithSeparators(number));  // "1.234.567,89" in French
print(_numerix.formatCompact(12345678));       // "12,3M"
print(_numerix.formatOrdinal(23));              // "23e" in French
print(_numerix.formatCurrency(1234.56, symbol: '€')); // "€1.234,56"
print(_numerix.numberToWords(42));              // "forty-two" (English only)
print(_numerix.formatDuration(3661));           // "1h 1m 1s"
```

### Supported Languages

| Language Code | Language        |
| ------------- | --------------- |
| en            | English         |
| es            | Spanish         |
| fr            | French          |
| id            | Indonesian      |
| fa            | Persian         |
| ar            | Arabic          |
| it            | Italian         |
| th            | Thai            |
| ca            | Catalan         |
| gb            | British English |
| de            | German          |
| jp            | Japanese        |
| ru            | Russian         |
| kr            | Korean          |
| cn            | Chinese         |
| pt            | Portuguese      |
| nl            | Dutch           |
| se            | Swedish         |
| pl            | Polish          |

### Features

- Number formatting: Add localized thousand and decimal separators.
- Compact formatting: Display large numbers in short form (e.g., 1.2K, 3.4M) with localization.
- Ordinal formatting: Supports localized ordinal suffixes and prefixes.
- Currency formatting: Flexible symbol placement and spacing.
- Percentage formatting: Format decimals as percentages.
- Roman numerals: Convert integers (1-3999) to Roman numerals.
- Number to words: English-only conversion of integers to spelled-out words.
- Fractional formatting: Approximate decimal numbers as mixed fractions.
- Byte size formatting: Human-readable byte sizes with units.
- Duration formatting: Convert seconds to h, m, s format.
- Digit localization: Display digits in localized scripts (e.g., Persian, Arabic).
- Parsing: Parse localized formatted numbers back to numeric values.

### Contributing

Contributions are welcome! Please open an issue or submit a pull request on the GitHub repository.

### License

MIT License © [PT. Nicxon International Solutions](https://nicxonsolutions.com)
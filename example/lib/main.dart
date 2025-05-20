// import 'package:flutter/material.dart';
// import 'package:numerix/numerix.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final _numerix = Numerix(
//     languageCode: 'en',
//     decimalSeparator: '.',
//     thousandSeparator: ',',
//     compactDecimalPlaces: 2,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     final number = 1234567.89;
//     final compactNumber = 12345678;
//     final ordinalNumber = 23;
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Numerix Plugin Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Formatted with separators:',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               Text(_numerix.formatWithSeparators(number)),
//               const SizedBox(height: 20),
//
//               Text(
//                 'Compact format:',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               Text(_numerix.formatCompact(compactNumber)),
//               const SizedBox(height: 20),
//
//               Text(
//                 'Ordinal format:',
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//               Text(_numerix.formatOrdinal(ordinalNumber)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:numerix/numerix.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _numerix = Numerix(
    languageCode: 'en',
    decimalSeparator: '.',
    thousandSeparator: ',',
    compactDecimalPlaces: 2,
  );

  @override
  Widget build(BuildContext context) {
    final number = 1234567.89;
    final compactNumber = 12345678;
    final ordinalNumber = 23;
    final currencyNumber = 98765.4321;
    final percentageNumber = 0.8754;
    final formattedString = '1,234,567.89';
    final significantNumber = 0.00456789;
    final fractionalNumber = 2.75;
    final romanNumber = 1988;
    final wordsNumber = 1234;
    final scientificNumber = 0.0001234;
    final byteSizeNumber = 123456789;
    final paddedNumber = 42;
    final clampTestNumber = 105;
    final durationSeconds = 3661;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Numerix Plugin Example')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Formatted with separators:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatWithSeparators(number)),
              const SizedBox(height: 16),

              Text(
                'Compact format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatCompact(compactNumber)),
              const SizedBox(height: 16),

              Text(
                'Ordinal format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatOrdinal(ordinalNumber)),
              const SizedBox(height: 16),

              Text(
                'Currency format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                _numerix.formatCurrency(
                  currencyNumber,
                  symbol: '\$',
                  symbolBefore: true,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                'Percentage format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatPercentage(percentageNumber)),
              const SizedBox(height: 16),

              Text(
                'Parse formatted number:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.parseFormattedNumber(formattedString)),
              const SizedBox(height: 16),

              Text(
                'Significant digits format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatSignificantDigits(significantNumber, 3)),
              const SizedBox(height: 16),

              Text(
                'Fractional format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatFractional(fractionalNumber)),
              const SizedBox(height: 16),

              Text(
                'Roman numerals:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.convertToRomanNumerals(romanNumber)),
              const SizedBox(height: 16),

              Text(
                'Number to words:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.numberToWords(wordsNumber)),
              const SizedBox(height: 16),

              Text(
                'Scientific notation:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatScientificNotation(scientificNumber)),
              const SizedBox(height: 16),

              Text(
                'Byte size format:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatByteSize(byteSizeNumber)),
              const SizedBox(height: 16),

              Text(
                'Number with padding:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatWithPadding(paddedNumber, 5)),
              const SizedBox(height: 16),

              Text(
                'Clamped number (0 to 100):',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.clampNumber(clampTestNumber, 0, 100)),
              const SizedBox(height: 16),

              Text(
                'Duration format (h m s):',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(_numerix.formatDuration(durationSeconds)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// class Numerix {
//   final String languageCode;
//   final String decimalSeparator;
//   final String thousandSeparator;
//   final int compactDecimalPlaces;
//
//   Numerix({
//     this.languageCode = 'en',
//     this.decimalSeparator = '.',
//     this.thousandSeparator = ',',
//     this.compactDecimalPlaces = 1,
//   });
//
//   // Convert Western digits to locale-specific digits if needed
//   String _convertDigitsIfNeeded(String input) {
//     if (languageCode == 'fa') {
//       return convertDigits(input, _persianDigits);
//     } else if (languageCode == 'ar') {
//       return convertDigits(input, _arabicDigits);
//     }
//     return input; // default: no conversion
//   }
//
//   String formatWithSeparators(num number) {
//     // Format number with fixed 2 decimals
//     final fixedDecimal = number.toStringAsFixed(2);
//     var parts = fixedDecimal.split('.');
//     var integerPart = parts[0];
//     var decimalPart = parts.length > 1 ? parts[1] : '';
//
//     // Insert thousand separators manually (from right to left)
//     final buffer = StringBuffer();
//     for (int i = 0; i < integerPart.length; i++) {
//       final reversedIndex = integerPart.length - i - 1;
//       buffer.write(integerPart[reversedIndex]);
//       if ((i + 1) % 3 == 0 && i != integerPart.length - 1) {
//         buffer.write(thousandSeparator);
//       }
//     }
//     final reversed = buffer.toString().split('').reversed.join('');
//
//     final result = decimalPart.isEmpty
//         ? reversed
//         : '$reversed$decimalSeparator$decimalPart';
//
//     return _convertDigitsIfNeeded(result);
//   }
//
//   String formatCompact(num number) {
//     final suffixes = LocaleData.suffixes[languageCode] ?? LocaleData.suffixes['en']!;
//     const divisors = {
//       'T': 1e12,
//       'B': 1e9,
//       'M': 1e6,
//       'K': 1e3,
//     };
//
//     for (final suffix in ['T', 'B', 'M', 'K']) {
//       final divisor = divisors[suffix]!;
//       if (number >= divisor) {
//         final value = number / divisor;
//         final formattedValue = value.toStringAsFixed(compactDecimalPlaces);
//         final result = '$formattedValue${suffixes[suffix]}';
//         return _convertDigitsIfNeeded(result);
//       }
//     }
//
//     return _convertDigitsIfNeeded(number.toString());
//   }
//
//   String formatOrdinal(int number) {
//     final suffix = _getOrdinalSuffix(number);
//     final result = '$number$suffix';
//     return _convertDigitsIfNeeded(result);
//   }
//
//   String _getOrdinalSuffix(int number) {
//     final langSuffix = LocaleData.ordinals[languageCode]?['suffix'] ?? '';
//     if (languageCode == 'en') {
//       final n = number % 100;
//       if (n >= 11 && n <= 13) return 'th';
//       switch (number % 10) {
//         case 1:
//           return 'st';
//         case 2:
//           return 'nd';
//         case 3:
//           return 'rd';
//         default:
//           return 'th';
//       }
//     }
//     // Default fallback for other languages:
//     return langSuffix;
//   }
// }
//
// // Persian digit map
// const Map<String, String> _persianDigits = {
//   '0': '۰',
//   '1': '۱',
//   '2': '۲',
//   '3': '۳',
//   '4': '۴',
//   '5': '۵',
//   '6': '۶',
//   '7': '۷',
//   '8': '۸',
//   '9': '۹',
// };
//
// // Arabic-Indic digit map
// const Map<String, String> _arabicDigits = {
//   '0': '٠',
//   '1': '١',
//   '2': '٢',
//   '3': '٣',
//   '4': '٤',
//   '5': '٥',
//   '6': '٦',
//   '7': '٧',
//   '8': '٨',
//   '9': '٩',
// };
//
// String convertDigits(String input, Map<String, String> digitMap) {
//   final buffer = StringBuffer();
//   for (var char in input.split('')) {
//     buffer.write(digitMap[char] ?? char);
//   }
//   return buffer.toString();
// }
//
// class LocaleData {
//   static const suffixes = {
//     'en': {'K': 'K', 'M': 'M', 'B': 'B', 'T': 'T'},
//     'es': {'K': 'mil', 'M': 'M', 'B': 'MM', 'T': 'T'},
//     'fr': {'K': 'k', 'M': 'M', 'B': 'Md', 'T': 'T'},
//     'id': {'K': 'rb', 'M': 'jt', 'B': 'M', 'T': 'T'},
//     'fa': {'K': 'هزار', 'M': 'میلیون', 'B': 'میلیارد', 'T': 'تریلیون'},
//     'ar': {'K': 'ألف', 'M': 'مليون', 'B': 'مليار', 'T': 'تريليون'},
//     'it': {'K': 'mila', 'M': 'mln', 'B': 'mld', 'T': 'trl'},
//     'th': {'K': 'พัน', 'M': 'ล้าน', 'B': 'ล้านล้าน', 'T': 'แสน'},
//     'ca': {'K': 'mil', 'M': 'M', 'B': 'MM', 'T': 'T'},
//     'gb': {'K': 'K', 'M': 'M', 'B': 'B', 'T': 'T'},
//     'de': {'K': 'Tsd', 'M': 'Mio', 'B': 'Mrd', 'T': 'Bio'},
//     'jp': {'K': '千', 'M': '百万', 'B': '十億', 'T': '兆'},     // Japanese
//     'ru': {'K': 'тыс', 'M': 'млн', 'B': 'млрд', 'T': 'трлн'}, // Russian
//     'kr': {'K': '천', 'M': '백만', 'B': '십억', 'T': '조'},    // Korean
//     'cn': {'K': '千', 'M': '百万', 'B': '十亿', 'T': '万亿'},    // Chinese Simplified
//     'pt': {'K': 'mil', 'M': 'mi', 'B': 'bi', 'T': 'tri'},     // Portuguese
//     'nl': {'K': 'duiz', 'M': 'mln', 'B': 'mld', 'T': 'bil'},  // Dutch
//     'se': {'K': 'tus', 'M': 'milj', 'B': 'mdr', 'T': 'bil'},  // Swedish
//     'pl': {'K': 'tys', 'M': 'mln', 'B': 'mld', 'T': 'bln'},   // Polish
//   };
//
//   static const ordinals = {
//     'en': {'suffix': ''},
//     'es': {'suffix': 'º'},
//     'fr': {'suffix': 'e'},
//     'id': {'suffix': ''},
//     'fa': {'suffix': 'م'},
//     'ar': {'suffix': 'م'},
//     'it': {'suffix': 'º'},
//     'th': {'suffix': 'ที่'},
//     'ca': {'suffix': 'è'},
//     'gb': {'suffix': ''},
//     'de': {'suffix': '.'},
//     'jp': {'suffix': '番'},  // Japanese ordinal indicator
//     'ru': {'suffix': '-й'},  // Russian ordinal suffix
//     'kr': {'suffix': '번째'}, // Korean ordinal suffix
//     'cn': {'suffix': '第'},   // Chinese ordinal prefix
//     'pt': {'suffix': 'º'},   // Portuguese
//     'nl': {'suffix': 'de'},  // Dutch ordinal suffix
//     'se': {'suffix': 'e'},   // Swedish ordinal suffix
//     'pl': {'suffix': '.'},   // Polish ordinal suffix
//   };
// }

class Numerix {
  final String languageCode;
  final String decimalSeparator;
  final String thousandSeparator;
  final int compactDecimalPlaces;

  Numerix({
    this.languageCode = 'en',
    this.decimalSeparator = '.',
    this.thousandSeparator = ',',
    this.compactDecimalPlaces = 1,
  });

  String _localizeDigits(String input) {
    final map = LocaleData.digitMaps[languageCode];
    if (map == null) return input;
    return input.split('').map((ch) => map[ch] ?? ch).join();
  }

  // 1. Format number with separators (thousands, decimal)
  String formatWithSeparators(num number, {int decimalPlaces = 2}) {
    final fixedDecimal = number.toStringAsFixed(decimalPlaces);
    var parts = fixedDecimal.split('.');
    var integerPart = parts[0];
    var decimalPart = parts.length > 1 ? parts[1] : '';

    // Insert thousand separators manually
    final buffer = StringBuffer();
    for (int i = 0; i < integerPart.length; i++) {
      final reversedIndex = integerPart.length - i - 1;
      buffer.write(integerPart[reversedIndex]);
      if ((i + 1) % 3 == 0 && i != integerPart.length - 1) {
        buffer.write(thousandSeparator);
      }
    }
    final reversed = buffer.toString().split('').reversed.join('');
    return _localizeDigits(
      decimalPart.isEmpty ? reversed : '$reversed$decimalSeparator$decimalPart',
    );
  }

  // 2. Format compact (K, M, B, T) with localization
  String formatCompact(num number) {
    final suffixes =
        LocaleData.suffixes[languageCode] ?? LocaleData.suffixes['en']!;
    const divisors = {'T': 1e12, 'B': 1e9, 'M': 1e6, 'K': 1e3};

    for (final suffix in ['T', 'B', 'M', 'K']) {
      final divisor = divisors[suffix]!;
      if (number >= divisor) {
        final value = number / divisor;
        final formattedValue = value.toStringAsFixed(compactDecimalPlaces);
        return _localizeDigits('$formattedValue${suffixes[suffix]}');
      }
    }

    return number.toString();
  }

  // 3. Format ordinal (1st, 2nd, etc.), with prefix support
  String formatOrdinal(int number) {
    final ordinalData =
        LocaleData.ordinals[languageCode] ?? LocaleData.ordinals['en']!;
    final prefix = ordinalData['prefix'] ?? '';
    final suffix = ordinalData['suffix'] ?? '';

    // English special rules example
    if (languageCode == 'en' && suffix.isNotEmpty) {
      final n = number % 100;
      if (n >= 11 && n <= 13) return '$prefix${number}th';
      switch (number % 10) {
        case 1:
          return '$prefix${number}st';
        case 2:
          return '$prefix${number}nd';
        case 3:
          return '$prefix${number}rd';
        default:
          return '$prefix${number}th';
      }
    }

    // Default fallback with prefix or suffix
    return _localizeDigits('$prefix$number$suffix');
  }

  // 4. Format currency with symbol, placement, spacing
  String formatCurrency(
    num number, {
    String symbol = '\$',
    bool symbolBefore = true,
    int decimalPlaces = 2,
    String? spaceBetweenSymbol,
    bool useSeparators = true,
  }) {
    final formattedNumber =
        useSeparators
            ? formatWithSeparators(number, decimalPlaces: decimalPlaces)
            : number.toStringAsFixed(decimalPlaces);

    final space = spaceBetweenSymbol ?? '';

    if (symbolBefore) {
      return '$symbol$space$formattedNumber';
    } else {
      return _localizeDigits('$formattedNumber$space$symbol');
    }
  }

  // 5. Format percentage with optional decimals and symbol
  String formatPercentage(
    num number, {
    int decimalPlaces = 2,
    String symbol = '%',
  }) {
    final value = (number * 100).toStringAsFixed(decimalPlaces);
    return _localizeDigits('$value$symbol');
  }

  // 6. Parse formatted number string back to num
  String parseFormattedNumber(String formatted) {
    // Remove thousand separators and replace decimal separator with '.'
    final normalized = formatted
        .replaceAll(thousandSeparator, '')
        .replaceAll(decimalSeparator, '.');

    final parsed = num.tryParse(normalized);
    return _localizeDigits((parsed ?? 0).toString());
  }

  // 7. Format significant digits
  String formatSignificantDigits(num number, int significantDigits) {
    return _localizeDigits(number.toStringAsPrecision(significantDigits));
  }

  // 8. Format fractional number as mixed fraction (simple implementation)
  String formatFractional(double number, {int maxDenominator = 16}) {
    int whole = number.floor();
    double frac = number - whole;

    // Approximate fraction using simple algorithm (Farey sequence)
    int numerator = 0;
    int denominator = 1;
    double minDiff = double.infinity;

    for (int d = 1; d <= maxDenominator; d++) {
      int n = (frac * d).round();
      double diff = (frac - n / d).abs();
      if (diff < minDiff) {
        numerator = n;
        denominator = d;
        minDiff = diff;
      }
    }

    if (numerator == 0) {
      return _localizeDigits(whole.toString());
    }

    if (whole == 0) {
      return _localizeDigits('$numerator/$denominator');
    }

    return _localizeDigits('$whole $numerator/$denominator');
  }

  // 9. Convert integer to Roman numerals (1-3999)
  String convertToRomanNumerals(int number) {
    if (number < 1 || number > 3999) return number.toString();

    final Map<int, String> romanMap = {
      1000: 'M',
      900: 'CM',
      500: 'D',
      400: 'CD',
      100: 'C',
      90: 'XC',
      50: 'L',
      40: 'XL',
      10: 'X',
      9: 'IX',
      5: 'V',
      4: 'IV',
      1: 'I',
    };

    var result = StringBuffer();
    var remainder = number;

    for (var entry in romanMap.entries) {
      while (remainder >= entry.key) {
        result.write(entry.value);
        remainder -= entry.key;
      }
    }
    return _localizeDigits(result.toString());
  }

  // 10. Convert number to words (English only, basic)
  String numberToWords(int number) {
    if (number == 0) return 'zero';

    final units = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
    ];
    final teens = [
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen',
    ];
    final tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety',
    ];
    final thousands = ['', 'thousand', 'million', 'billion', 'trillion'];

    String convertHundreds(int n) {
      String str = '';
      if (n >= 100) {
        str += '${units[n ~/ 100]} hundred ';
        n %= 100;
      }
      if (n >= 20) {
        str += tens[n ~/ 10];
        if (n % 10 > 0) str += '-${units[n % 10]}';
      } else if (n >= 10) {
        str += teens[n - 10];
      } else if (n > 0) {
        str += units[n];
      }
      return str.trim();
    }

    var result = StringBuffer();
    int i = 0;
    while (number > 0) {
      int part = number % 1000;
      if (part > 0) {
        final words = convertHundreds(part);
        if (i > 0) {
          result.write('$words ${thousands[i]} ');
        } else {
          result.write('$words ');
        }
      }
      number ~/= 1000;
      i++;
    }
    return result.toString().trim();
  }

  // 11. Format scientific notation with decimal places
  String formatScientificNotation(num number, {int decimalPlaces = 2}) {
    return _localizeDigits(number.toStringAsExponential(decimalPlaces));
  }

  // 12. Format byte size (human readable)
  String formatByteSize(num bytes, {int decimalPlaces = 2}) {
    final units =
        LocaleData.byteUnits[languageCode] ?? LocaleData.byteUnits['en']!;

    if (bytes < 1024) return '$bytes B';
    int i = 0;
    double size = bytes.toDouble();
    while (size >= 1024 && i < units.length - 1) {
      size /= 1024;
      i++;
    }
    return _localizeDigits(
      '${size.toStringAsFixed(decimalPlaces)} ${units[i]}',
    );
  }

  // 13. Format with leading zeros/padding
  String formatWithPadding(num number, int length) {
    return _localizeDigits(number.toString().padLeft(length, '0'));
  }

  // 14. Clamp number within range
  String clampNumber(num number, num min, num max) {
    if (number < min) return _localizeDigits(min.toString());
    if (number > max) return _localizeDigits(max.toString());
    return _localizeDigits(number.toString());
  }

  // 15. Format duration from seconds to h m s
  String formatDuration(int totalSeconds) {
    final units =
        LocaleData.durationUnits[languageCode] ??
        LocaleData.durationUnits['en']!;

    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;
    final parts = <String>[];
    if (hours > 0) parts.add('$hours${units['h']}');
    if (minutes > 0) parts.add('$minutes${units['m']}');
    if (seconds > 0 || parts.isEmpty) parts.add('$seconds${units['s']}');
    return _localizeDigits(parts.join(' '));
  }
}

// Example LocaleData for suffixes and ordinals
class LocaleData {
  static const suffixes = {
    'en': {'K': 'K', 'M': 'M', 'B': 'B', 'T': 'T'},
    'es': {'K': 'mil', 'M': 'M', 'B': 'MM', 'T': 'T'},
    'fr': {'K': 'k', 'M': 'M', 'B': 'Md', 'T': 'T'},
    'id': {'K': 'rb', 'M': 'jt', 'B': 'M', 'T': 'T'},
    'fa': {'K': 'هزار', 'M': 'میلیون', 'B': 'میلیارد', 'T': 'تریلیون'},
    'ar': {'K': 'ألف', 'M': 'مليون', 'B': 'مليار', 'T': 'تريليون'},
    'it': {'K': 'mila', 'M': 'mln', 'B': 'mld', 'T': 'trl'},
    'th': {'K': 'พัน', 'M': 'ล้าน', 'B': 'ล้านล้าน', 'T': 'แสน'},
    'ca': {'K': 'mil', 'M': 'M', 'B': 'MM', 'T': 'T'},
    'gb': {'K': 'K', 'M': 'M', 'B': 'B', 'T': 'T'},
    'de': {'K': 'Tsd', 'M': 'Mio', 'B': 'Mrd', 'T': 'Bio'},
  };

  static const ordinals = {
    'en': {'prefix': '', 'suffix': ''},
    'es': {'prefix': '', 'suffix': 'º'},
    'fr': {'prefix': '', 'suffix': 'e'},
    'id': {'prefix': '', 'suffix': ''},
    'fa': {'prefix': '', 'suffix': 'م'},
    'ar': {'prefix': '', 'suffix': 'م'},
    'it': {'prefix': '', 'suffix': 'º'},
    'th': {'prefix': '', 'suffix': 'ที่'},
    'ca': {'prefix': '', 'suffix': 'è'},
    'gb': {'prefix': '', 'suffix': ''},
    'de': {'prefix': '', 'suffix': '.'},
    'jp': {'prefix': '', 'suffix': '番'}, // Japanese ordinal indicator
    'ru': {'prefix': '', 'suffix': '-й'}, // Russian ordinal suffix
    'kr': {'prefix': '', 'suffix': '번째'}, // Korean ordinal suffix
    'cn': {'prefix': '第', 'suffix': ''}, // Chinese ordinal prefix
    'pt': {'prefix': '', 'suffix': 'º'}, // Portuguese
    'nl': {'prefix': '', 'suffix': 'de'}, // Dutch ordinal suffix
    'se': {'prefix': '', 'suffix': 'e'}, // Swedish ordinal suffix
    'pl': {'prefix': '', 'suffix': '.'}, // Polish ordinal suffix
  };

  static const byteUnits = {
    'en': ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'],
    'fr': ['o', 'Ko', 'Mo', 'Go', 'To', 'Po', 'Eo'],
    'de': ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'],
    'es': ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'],
    'fa': [
      'بایت',
      'کیلوبایت',
      'مگابایت',
      'گیگابایت',
      'ترابایت',
      'پتابایت',
      'اگزابایت',
    ],
    'ar': [
      'بايت',
      'كيلوبايت',
      'ميغابايت',
      'غيغابايت',
      'تيرابايت',
      'بيتابايت',
      'إكسابايت',
    ],
    'ru': ['Б', 'КБ', 'МБ', 'ГБ', 'ТБ', 'ПБ', 'ЭБ'],
    'zh': ['字节', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'],
    'ja': ['バイト', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'],
  };

  static const durationUnits = {
    'en': {'h': 'h', 'm': 'm', 's': 's'},
    'fr': {'h': 'h', 'm': 'min', 's': 's'},
    'de': {'h': 'Std', 'm': 'Min', 's': 'Sek'},
    'es': {'h': 'h', 'm': 'min', 's': 's'},
    'fa': {'h': 'ساعت', 'm': 'دقیقه', 's': 'ثانیه'},
    'ar': {'h': 'س', 'm': 'د', 's': 'ث'},
    'ru': {'h': 'ч', 'm': 'м', 's': 'с'},
    'zh': {'h': '小时', 'm': '分', 's': '秒'},
    'ja': {'h': '時間', 'm': '分', 's': '秒'},
  };

  static const digitMaps = {
    'fa': {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    },
    'ar': {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    },
    // Extend to other languages if needed
  };
}

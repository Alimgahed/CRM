import 'package:intl/intl.dart';

/// Extension for formatting numbers as prices
extension NumberFormatExtension on num {
  /// Format number as price with thousand separators
  /// Example: 1000000 -> "1,000,000"
  String toPrice() {
    return NumberFormat('#,##0', 'en_US').format(this);
  }

  /// Format number as price with currency symbol
  /// Example: 1000000 -> "1,000,000 EGP"
  String toPriceWithCurrency({String currency = 'EGP'}) {
    return '${NumberFormat('#,##0', 'en_US').format(this)} $currency';
  }

  /// Format number as price with decimals
  /// Example: 1000000.50 -> "1,000,000.50"
  String toPriceWithDecimals({int decimals = 2}) {
    return NumberFormat('#,##0.${'0' * decimals}', 'en_US').format(this);
  }

  /// Format number as compact price
  /// Example: 1000000 -> "1M", 1500 -> "1.5K"
  String toCompactPrice() {
    return NumberFormat.compact(locale: 'en_US').format(this);
  }

  /// Format number as Arabic price (Arabic numerals with comma separator)
  /// Example: 1000000 -> "١٬٠٠٠٬٠٠٠"
  String toArabicPrice() {
    return NumberFormat('#,##0', 'ar').format(this);
  }
}

/// Extension for nullable numbers
extension NullableNumberFormatExtension on num? {
  /// Format nullable number as price, return placeholder if null
  /// Example: null -> "—", 1000000 -> "1,000,000"
  String toPrice({String placeholder = '—'}) {
    if (this == null) return placeholder;
    return this!.toPrice();
  }

  /// Format nullable number as price with currency
  String toPriceWithCurrency({
    String currency = 'EGP',
    String placeholder = '—',
  }) {
    if (this == null) return placeholder;
    return this!.toPriceWithCurrency(currency: currency);
  }

  /// Format nullable number as compact price
  String toCompactPrice({String placeholder = '—'}) {
    if (this == null) return placeholder;
    return this!.toCompactPrice();
  }
}

/// Extension for String numbers
extension StringNumberFormatExtension on String? {
  /// Parse string to number and format as price
  /// Example: "1000000" -> "1,000,000"
  String toPrice({String placeholder = '—'}) {
    if (this == null || this!.isEmpty) return placeholder;
    final number = num.tryParse(this!);
    if (number == null) return placeholder;
    return number.toPrice();
  }

  /// Parse string to number and format as price with currency
  String toPriceWithCurrency({
    String currency = 'EGP',
    String placeholder = '—',
  }) {
    if (this == null || this!.isEmpty) return placeholder;
    final number = num.tryParse(this!);
    if (number == null) return placeholder;
    return number.toPriceWithCurrency(currency: currency);
  }

  /// Parse string to number and format as compact price
  String toCompactPrice({String placeholder = '—'}) {
    if (this == null || this!.isEmpty) return placeholder;
    final number = num.tryParse(this!);
    if (number == null) return placeholder;
    return number.toCompactPrice();
  }
}

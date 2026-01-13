import 'package:intl/intl.dart';

class NumberFormatService {
  static final NumberFormatService _instance = NumberFormatService._internal();
  static NumberFormatService get instance => _instance;

  NumberFormatService._internal();

  String _currentLocale = 'ar';

  // Cached formatters for each locale
  final Map<String, NumberFormat> _priceFormatters = {};
  final Map<String, NumberFormat> _compactFormatters = {};
  final Map<String, NumberFormat> _decimalFormatters = {};

  /// Update locale and clear cache
  void updateLocale(String locale) {
    if (_currentLocale != locale) {
      _currentLocale = locale;
      _clearCache();
    }
  }

  String get currentLocale => _currentLocale;

  void _clearCache() {
    _priceFormatters.clear();
    _compactFormatters.clear();
    _decimalFormatters.clear();
  }

  /// Get or create price formatter (locale-aware numerals)
  NumberFormat _getPriceFormatter() {
    return _priceFormatters.putIfAbsent(
      _currentLocale,
      () => NumberFormat('#,##0', _getNumberLocale()),
    );
  }

  /// Get or create compact formatter (1M, 1K format)
  NumberFormat _getCompactFormatter() {
    return _compactFormatters.putIfAbsent(
      _currentLocale,
      () => NumberFormat.compact(locale: _getNumberLocale()),
    );
  }

  /// Get or create decimal formatter (for prices with decimals)
  NumberFormat _getDecimalFormatter() {
    return _decimalFormatters.putIfAbsent(
      _currentLocale,
      () => NumberFormat('#,##0.00', _getNumberLocale()),
    );
  }

  /// Get the correct locale for number formatting
  /// Arabic uses 'ar' for Arabic-Indic numerals (٠١٢٣...)
  /// English uses 'en_US' for Western numerals (0123...)
  String _getNumberLocale() {
    return _currentLocale == 'ar' ? 'ar' : 'en_US';
  }

  // ============ PUBLIC FORMATTING METHODS ============

  /// Format number as price: 1000000 -> "1,000,000"
  String formatPrice(num value) {
    return _getPriceFormatter().format(value);
  }

  /// Format with currency: 1000000 -> "1,000,000 EGP"
  String formatPriceWithCurrency(num value, String currency) {
    return '${formatPrice(value)} $currency';
  }

  /// Format as compact: 1500 -> "1.5K"
  String formatCompact(num value) {
    return _getCompactFormatter().format(value);
  }

  /// Format with decimals: 1000.5 -> "1,000.50"
  String formatDecimal(num value) {
    return _getDecimalFormatter().format(value);
  }

  /// Format with custom decimal places
  String formatWithDecimals(num value, int decimals) {
    final pattern = '#,##0.${'0' * decimals}';
    final formatter = NumberFormat(pattern, _getNumberLocale());
    return formatter.format(value);
  }
}

// =============================================================
// EXTENSIONS - CLEAN API
// lib/core/localization/number_format_extensions.dart
// =============================================================

/// Extension on num for easy formatting
extension NumberFormatExtension on num {
  /// 1000000 -> "1,000,000"
  String toPrice() => NumberFormatService.instance.formatPrice(this);

  /// 1000000 -> "1,000,000 EGP"
  String toPriceWithCurrency(String currency) =>
      NumberFormatService.instance.formatPriceWithCurrency(this, currency);

  /// 1500 -> "1.5K"
  String toCompactPrice() => NumberFormatService.instance.formatCompact(this);

  /// 1000.5 -> "1,000.50"
  String toDecimalPrice() => NumberFormatService.instance.formatDecimal(this);

  /// Format with custom decimal places
  String toFormattedPrice(int decimals) =>
      NumberFormatService.instance.formatWithDecimals(this, decimals);
}

/// Extension on nullable num
extension NullableNumberFormatExtension on num? {
  String toPrice({String placeholder = '—'}) {
    return this?.toPrice() ?? placeholder;
  }

  String toPriceWithCurrency(String currency, {String placeholder = '—'}) {
    return this?.toPriceWithCurrency(currency) ?? placeholder;
  }

  String toCompactPrice({String placeholder = '—'}) {
    return this?.toCompactPrice() ?? placeholder;
  }

  String toDecimalPrice({String placeholder = '—'}) {
    return this?.toDecimalPrice() ?? placeholder;
  }

  String toFormattedPrice(int decimals, {String placeholder = '—'}) {
    return this?.toFormattedPrice(decimals) ?? placeholder;
  }
}

/// Extension on String for parsing and formatting
extension StringNumberFormatExtension on String? {
  num? _parse() {
    final str = this;
    if (str == null || str.isEmpty) return null;
    // Remove any existing formatting
    final cleaned = str.replaceAll(RegExp(r'[,\s]'), '');
    return num.tryParse(cleaned);
  }

  String toPrice({String placeholder = '—'}) {
    return _parse()?.toPrice() ?? placeholder;
  }

  String toPriceWithCurrency(String currency, {String placeholder = '—'}) {
    return _parse()?.toPriceWithCurrency(currency) ?? placeholder;
  }

  String toCompactPrice({String placeholder = '—'}) {
    return _parse()?.toCompactPrice() ?? placeholder;
  }

  String toDecimalPrice({String placeholder = '—'}) {
    return _parse()?.toDecimalPrice() ?? placeholder;
  }
}

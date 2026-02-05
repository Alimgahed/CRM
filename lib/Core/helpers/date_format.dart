import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Extension on String to handle date operations if the string is a valid date
/// import 'package:intl/intl.dart';

class DateUtilsHelper {
  // Create formatter ONCE (static = reused, less CPU & memory)
  static final DateFormat _utcFormatter = DateFormat(
    "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS'+00:00'",
  );

  /// Converts any date input to UTC formatted string
  static String toUtcString(dynamic date) {
    if (date == null) return '';

    final DateTime parsedDate = date is DateTime
        ? date
        : DateTime.parse(date.toString());

    return _utcFormatter.format(parsedDate.toUtc());
  }
}

extension DateTimeLocalization on String {
  /// Helper to convert the string to a DateTime safely
  DateTime? _toDateTime() => DateTime.tryParse(this);

  /// Format the date string according to the locale
  String toFormattedDate(AppLocalizations loc, {String? pattern}) {
    final date = _toDateTime();
    if (date == null) return this;

    final locale = loc.locale;
    String formatted = DateFormat(pattern ?? 'dd-MM-yyyy', locale).format(date);

    // If locale is Arabic, add RTL marker \u200F
    return locale.startsWith('ar') ? '\u200F$formatted' : formatted;
  }

  /// Get relative time from a date string (e.g., "2 days ago")
  String relativeToNow(AppLocalizations loc) {
    final date = _toDateTime();
    if (date == null) return this; // Return original string if not a valid date

    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) return loc.justNow;
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${loc.minutesAgo}';
    }
    if (difference.inHours < 24) {
      return '${difference.inHours} ${loc.hoursAgo}';
    }
    if (difference.inDays < 7) {
      return '${difference.inDays} ${loc.daysAgo}';
    }

    // fallback: formatted date using the locale
    return DateFormat.yMMMd(loc.locale).format(date);
  }
}

extension TextControllerParsing on TextEditingController {
  double? get parseAsDouble {
    final cleaned = text.trim().replaceAll(',', '');
    if (cleaned.isEmpty) return null;
    return double.tryParse(cleaned);
  }

  int? get parseAsInt {
    final cleaned = text.trim().replaceAll(',', '');
    if (cleaned.isEmpty) return null;
    return int.tryParse(cleaned);
  }
}

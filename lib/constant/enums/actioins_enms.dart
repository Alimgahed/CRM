import 'package:crm/features/language/localazation.dart';
import 'package:intl/intl.dart';

/// Helper class for action-related utility functions
/// Optimized for performance with const constructors and static methods
class ActionHelper {
  // Private constructor to prevent instantiation
  const ActionHelper._();

  /// Formats a DateTime object to a readable string
  /// Returns '-' if date is null

  /// Gets the localized action type string based on the type code
  static String getActionType(int? type, AppLocalizations appLocalizations) {
    switch (type) {
      case 1:
        return appLocalizations.call;
      case 2:
        return appLocalizations.cancelled;
      case 3:
        return appLocalizations.interested;
      case 4:
        return appLocalizations.deal;
      case 5:
        return appLocalizations.booked;
      case 6:
        return appLocalizations.meeting;
      case 7:
        return appLocalizations.rental;
      default:
        return '-';
    }
  }

  /// Gets the localized next follow-up period string
  static String getNextFollow(int? type, AppLocalizations appLocalizations) {
    switch (type) {
      case 1:
        return appLocalizations.hours;
      case 2:
        return appLocalizations.twoHours;
      case 3:
        return appLocalizations.nextDay;
      case 4:
        return appLocalizations.nextWeek;
      default:
        return '-';
    }
  }

  static String getMeetingType(int? type, AppLocalizations appLocalizations) {
    switch (type) {
      case 1:
        return appLocalizations.online;
      case 2:
        return appLocalizations.offline;
      default:
        return '-';
    }
  }

  static String getMeetingLocation(
    int? location,
    AppLocalizations appLocalizations,
  ) {
    switch (location) {
      case 1:
        return appLocalizations.indoor;
      case 2:
        return appLocalizations.outdoor;

      default:
        return '-';
    }
  }

  /// Formats currency values with proper formatting
  /// Returns '-' if value is null
  static String formatCurrency(int? value, {String currency = 'EGP'}) {
    if (value == null) return '-';
    final formatter = NumberFormat('#,###');
    return '${formatter.format(value)} $currency';
  }

  /// Formats duration in months
  /// Returns '-' if value is null
  static String formatDuration(int? months, AppLocalizations appLocalizations) {
    if (months == null) return '-';
    // You can add proper localization key for 'month'/'months'
    return '$months شهر';
  }

  /// Checks if a string is null or empty
  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  /// Returns the value or a default placeholder
  static String valueOrDefault(String? value, {String defaultValue = '-'}) {
    return isNullOrEmpty(value) ? defaultValue : value!;
  }
}

/// Extension on int for action type checking
extension ActionTypeExtension on int {
  bool get isCall => this == 1;
  bool get isCancelled => this == 2;
  bool get isInterested => this == 3;
  bool get isDeal => this == 4;
  bool get isBooked => this == 5;
  bool get isMeeting => this == 6;
  bool get isRental => this == 7;
}

import 'package:crm/features/language/localazation.dart';
import 'package:intl/intl.dart';

/// Action Type Enum
enum ActionType {
  call(1),
  cancelled(2),
  interested(3),
  deal(4),
  booked(5),
  meeting(6),
  rental(7);

  final int value;
  const ActionType(this.value);

  /// Get ActionType from int value
  static ActionType? fromValue(int? value) {
    if (value == null) return null;
    try {
      return ActionType.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}

/// Helper class for action-related utility functions
/// Optimized for performance with const constructors and static methods
class ActionHelper {
  // Private constructor to prevent instantiation
  const ActionHelper._();

  /// Gets the localized action type string based on the type code
  static String getActionType(
    ActionType type,
    AppLocalizations appLocalizations,
  ) {
    switch (type) {
      case ActionType.call:
        return appLocalizations.call;
      case ActionType.cancelled:
        return appLocalizations.cancelled;
      case ActionType.interested:
        return appLocalizations.interested;
      case ActionType.deal:
        return appLocalizations.deal;
      case ActionType.booked:
        return appLocalizations.booked;
      case ActionType.meeting:
        return appLocalizations.meeting;
      case ActionType.rental:
        return appLocalizations.rental;
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

  /// Gets the localized meeting type string
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

  /// Gets the localized meeting location string
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

/// Extension on ActionType for easy checking
extension ActionTypeExtension on ActionType {
  bool get isCall => this == ActionType.call;
  bool get isCancelled => this == ActionType.cancelled;
  bool get isInterested => this == ActionType.interested;
  bool get isDeal => this == ActionType.deal;
  bool get isBooked => this == ActionType.booked;
  bool get isMeeting => this == ActionType.meeting;
  bool get isRental => this == ActionType.rental;
}

/// Extension on int for backward compatibility
/// Use ActionType.fromValue(int) instead for better type safety
extension ActionTypeIntExtension on int {
  bool get isCall => this == 1;
  bool get isCancelled => this == 2;
  bool get isInterested => this == 3;
  bool get isDeal => this == 4;
  bool get isBooked => this == 5;
  bool get isMeeting => this == 6;
  bool get isRental => this == 7;
}

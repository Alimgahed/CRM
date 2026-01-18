import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

String getStatusText(int status, AppLocalizations loc) {
  switch (status) {
    case 1:
      return loc.newLead;
    case 2:
      return loc.conected;
    case 3:
      return loc.qualified;
    case 4:
      return loc.closed;
    case 5:
      return loc.customer;
    default:
      return loc.customer;
  }
}

/// Optimized colors according to your app theme
Color getStatusColor(int status) {
  switch (status) {
    case 1: // New
      return infoColor; // previously Colors.yellow.shade600
    case 2: // Contacted
      return buttonColor; // previously Colors.blue.shade600
    case 3: // Qualified Deal
      return appColor; // previously Colors.orange.shade600
    case 4: // Closed
      return successColor; // previously Colors.green.shade600
    case 5: // Customer / Lost
      return warningColor; // previously Colors.red.shade600
    default:
      return secondaryTextColor; // fallback color
  }
}

String getStatusLabel(int status) {
  switch (status) {
    case 1:
      return 'متاح';
    case 2:
      return 'محجوز';
    case 3:
      return 'مباع';
    default:
      return 'غير محدد';
  }
}

Color getStatusLabelColor(int status) {
  switch (status) {
    case 1:
      return Colors.green;
    case 2:
      return Colors.orange;
    case 3:
      return Colors.red;
    default:
      return Colors.grey;
  }
}

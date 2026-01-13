import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';

Color getStatusColor(int status) {
  switch (status) {
    case 1:
      return appColor;
    case 2:
      return warningColor;
    case 3:
      return successColor;
    case 4:
      return Colors.grey;
    default:
      return appColor;
  }
}

String getStatusText(BuildContext context, int status) {
  final loc = AppLocalizations(Localizations.localeOf(context).languageCode);

  switch (status) {
    case 1:
      return loc.newClients;
    case 2:
      return loc.contactPerson;
    case 3:
      return loc.active;
    case 4:
      return loc.inactive;
    default:
      return loc.status;
  }
}

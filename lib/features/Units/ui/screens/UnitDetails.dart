import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/Unitdetails.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({super.key, required this.unit});
  final Unit unit;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.unitDetails)),
      body: SingleChildScrollView(child: UnitDetails(unit: unit)),
    );
  }
}

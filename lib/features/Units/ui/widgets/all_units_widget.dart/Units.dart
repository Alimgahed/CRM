import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/routing/routes.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/constant/enums/enums..dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitsWidget extends StatelessWidget {
  final Unit unit;
  const UnitsWidget({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section with Status Badge
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.grey.shade300, Colors.grey.shade200],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.business_outlined,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          unit.unitName!,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Status Badge
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusLabelColor(unit.status!),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: getStatusLabelColor(
                            unit.status!,
                          ).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      getStatusLabel(unit.status!),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Purpose Badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      unit.sellPurpose!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location
                  infoChip(
                    Icons.location_on_outlined,
                    '${unit.district}، ${unit.city}، ${unit.governate}',
                    secondaryTextColor,
                  ),

                  const SizedBox(height: 12),

                  // Price & Area
                  Row(
                    children: [
                      Expanded(
                        child: infoChip(
                          Icons.attach_money_outlined,
                          "${appLocalizations.projectArea} ${unit.totalPrice!.toString().toCompactPrice()}",
                          secondaryTextColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: infoChip(
                          Icons.square_foot_outlined,
                          "${appLocalizations.unitArea} ${unit.totalArea!.toString().toPrice()}",
                          secondaryTextColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Features Row
                  Row(
                    children: [
                      Expanded(
                        child: infoChip(
                          Icons.bed_outlined,
                          '${unit.bedrooms} ${appLocalizations.bedrooms}',
                          secondaryTextColor,
                        ),
                      ),
                      widthSpace(2),
                      Expanded(
                        child: infoChip(
                          Icons.bathtub_outlined,
                          '${unit.bathrooms} ${appLocalizations.bathrooms}',
                          secondaryTextColor,
                        ),
                      ),
                      widthSpace(2),

                      Expanded(
                        child: infoChip(
                          Icons.straighten_outlined,
                          '${unit.buildingArea} ${appLocalizations.m}',
                          secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // View Details Button
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      height: 45,
                      text: 'عرض التفاصيل الكاملة',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.unitDetails,
                          arguments: unit,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

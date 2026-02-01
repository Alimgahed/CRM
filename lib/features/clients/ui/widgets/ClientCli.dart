import 'package:crm/Core/di/dependency_injection.dart';
import 'package:crm/Core/helpers/app_helpers.dart';
import 'package:crm/Core/helpers/date_format.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/clients/data/model/request_model.dart';
import 'package:crm/features/clients/logic/cubit/request_cubit.dart';
import 'package:crm/features/clients/logic/states/request_states.dart';
import 'package:crm/features/clients/ui/widgets/shareble_widget/shareble.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientRequests extends StatelessWidget {
  final int leadid;
  const ClientRequests({super.key, required this.leadid});

  void _showRequestDetails(BuildContext context, RequestModel request) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (context) => FractionallySizedBox(
        heightFactor: 0.85,
        child: RequestDetailsSheet(request: request),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    final headers = [
      appLocalizations.unitType,
      appLocalizations.location,
      appLocalizations.area,
      appLocalizations.budget,
      appLocalizations.view,
    ];

    return BlocProvider(
      create: (context) =>
          RequestCubit(requestRepo: getIt())..fetchRequests(leadid),
      child: BlocBuilder<RequestCubit, RequestState>(
        builder: (context, state) {
          return state.when(
            error: (error) {
              return Center(
                child: Text(error, style: const TextStyle(color: Colors.red)),
              );
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (data) {
              if (data.isEmpty) {
                return const Center(child: Text('لا توجد طلبات'));
              }

              final rows = data
                  .map((request) {
                    return [
                      Text(
                        ActionHelper.valueOrDefault(request.unitType),
                        style: const TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ActionHelper.getLocation(
                          request.country,
                          request.governate,
                        ),
                        style: const TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${request.area} ${appLocalizations.m}",
                        style: const TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        ActionHelper.formatCurrency(request.budget),
                        style: const TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                      ShaderMask(
                        shaderCallback: (bounds) => appGradient.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),

                        child: IconButton(
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            size: 20,
                          ),
                          onPressed: () =>
                              _showRequestDetails(context, request),
                        ),
                      ),
                    ];
                  })
                  .toList(growable: false);

              return CustomTable(headers: headers, rows: rows, height: 300);
            },
            initial: () {
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

/// Helper class for request data formatting

/// Separated widget for better performance and code organization
class RequestDetailsSheet extends StatelessWidget {
  final RequestModel request;

  const RequestDetailsSheet({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            decoration: const BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Drag Handle
                Center(
                  child: Container(
                    width: 48,
                    height: 5,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Title
                Text(
                  l10n.requestDetails,
                  textAlign: TextAlign.center,
                  style: TextStyles.size20(
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  ),
                ),

                const SizedBox(height: 24),

                DetailCard(
                  label: l10n.unitType,
                  value: ActionHelper.valueOrDefault(request.unitType),
                  icon: Icons.home_work,
                ),
                DetailCard(
                  label: l10n.listingType,
                  value: ActionHelper.valueOrDefault(request.listingType),
                  icon: Icons.list_alt,
                ),
                DetailCard(
                  label: l10n.sellingPurpose,
                  value: ActionHelper.valueOrDefault(request.sellingPurpose),
                  icon: Icons.sell,
                ),
                DetailCard(
                  label: l10n.finshing,
                  value: ActionHelper.valueOrDefault(request.finishingType),
                  icon: Icons.construction,
                ),

                DetailCard(
                  label: l10n.country,
                  value: ActionHelper.getLocation(
                    request.country,
                    request.governate,
                  ),
                  icon: Icons.public,
                ),
                DetailCard(
                  label: l10n.governorate,
                  value: ActionHelper.getLocation(
                    request.country,
                    request.governate,
                  ),
                  icon: Icons.location_city,
                ),

                if (request.area != null)
                  DetailCard(
                    label: l10n.area,
                    value: "${request.area} ${l10n.m}",
                    icon: Icons.square_foot,
                  ),

                if (request.totalArea != null)
                  DetailCard(
                    label: l10n.area,
                    value: "${request.totalArea} ${l10n.m}",
                    icon: Icons.fullscreen,
                  ),

                if (request.noOfBedrooms != null)
                  DetailCard(
                    label: l10n.bedrooms,
                    value: '${request.noOfBedrooms}',
                    icon: Icons.bed,
                  ),

                if (request.noOfBathrooms != null)
                  DetailCard(
                    label: l10n.bathrooms,
                    value: '${request.noOfBathrooms}',
                    icon: Icons.bathtub,
                  ),

                if (request.hasParking != null)
                  DetailCard(
                    label: l10n.parking,
                    value: ActionHelper.getBooleanValue(request.hasParking),
                    icon: Icons.local_parking,
                    iconColor: request.hasParking == true
                        ? successColor
                        : warningColor,
                  ),

                if (request.budget != null)
                  DetailCard(
                    label: l10n.budget,
                    value: ActionHelper.formatCurrency(request.budget),
                    icon: Icons.account_balance_wallet,
                  ),

                DetailCard(
                  label: l10n.status,
                  value: request.isDeleted == true ? l10n.deleted : l10n.active,
                  icon: request.isDeleted == true
                      ? Icons.delete
                      : Icons.check_circle,
                  iconColor: request.isDeleted == true
                      ? deletedBadgeColor
                      : activeBadgeColor,
                ),

                if (request.createdAt != null)
                  DetailCard(
                    label: l10n.createdAt,
                    value: request.createdAt!.toFormattedDate(l10n),
                    icon: Icons.add_circle_outline,
                  ),

                if (request.updatedAt != null)
                  DetailCard(
                    label: l10n.updatedAt,
                    value: request.updatedAt!.toFormattedDate(l10n),
                    icon: Icons.update,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Reusable detail card widget for better performance

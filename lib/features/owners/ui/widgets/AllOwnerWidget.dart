import 'package:crm/Core/theming/Icons.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/owners/data/models/owners_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class AllOwnerWidget extends StatelessWidget {
  final Owner owner;

  const AllOwnerWidget({super.key, required this.owner});

  // -------------------- Actions --------------------

  Future<void> _makePhoneCall(String phoneNumber) async {
    try {
      await launchUrl(Uri(scheme: 'tel', path: phoneNumber));
    } catch (_) {}
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    try {
      await launchUrl(
        Uri.parse('https://wa.me/$phoneNumber'),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {}
  }

  // -------------------- UI --------------------

  @override
  Widget build(BuildContext context) {
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildInfoRow(isDark),
            const SizedBox(height: 16),
            _buildActionButtons(lang),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      owner.fullName ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyles.size16(color: Colors.black),
    );
  }

  Widget _buildInfoRow(bool isDark) {
    return Row(
      children: [
        infoChip(Icons.email_outlined, owner.email ?? '', secondaryTextColor),

        const SizedBox(width: 8),
        infoChip(Icons.phone_outlined, owner.phone ?? '', secondaryTextColor),
      ],
    );
  }

  Widget _buildActionButtons(AppLocalizations lang) {
    final phone = owner.phone;

    return Row(
      children: [
        Expanded(
          child: CustomButton(
            height: 42,
            margin: EdgeInsets.zero,
            text: lang.details,
            onPressed: () {},
          ),
        ),
        if (phone != null && phone.isNotEmpty) ...[
          const SizedBox(width: 12),
          ActionButton(
            color: Colors.green,
            icon: MyFlutterApp.whatsapp,
            onTap: () => _openWhatsApp(phone),
          ),
          const SizedBox(width: 8),
          ActionButton(
            color: Colors.green,
            icon: Icons.call_outlined,
            onTap: () => _makePhoneCall(phone),
          ),
        ],
      ],
    );
  }
}

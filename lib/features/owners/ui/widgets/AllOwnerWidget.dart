import 'package:crm/Core/theming/Icons.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/owners/data/models/owners_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

/// Optimized Owner Widget
/// - Uses const constructors where possible
/// - Minimizes rebuilds
/// - Efficient memory usage
class AllOwnerWidget extends StatelessWidget {
  final Owner owner;

  const AllOwnerWidget({super.key, required this.owner});

  // Cache formatted values to avoid recalculation

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _openWhatsApp(String phoneNumber) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/$phoneNumber');
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final lang = context.select<LocaleCubit, AppLocalizations>(
    //   (cubit) => AppLocalizations(cubit.currentLocale),
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildContactInfo(context),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  /// Header section with name and menu
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: appColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(child: Icon(Icons.person, color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  owner.fullName!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (owner.fullNameEn != null && owner.fullNameEn!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      owner.fullNameEn!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
          // More menu
          IconButton(
            icon: const Icon(Icons.more_vert, size: 20),
            color: Colors.grey.shade600,
            onPressed: () {
              // TODO: Show options menu
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  /// Contact information section
  Widget _buildContactInfo(BuildContext context) {
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Column(
        children: [
          // Email
          _ContactInfoRow(
            icon: Icons.email_outlined,
            text: owner.email!,
            onTap: () => _sendEmail(owner.email!),
          ),

          const SizedBox(height: 8),

          // Primary Phone
          _ContactInfoRow(
            icon: Icons.phone_outlined,
            text: owner.phone!,
            onTap: () => _makePhoneCall(owner.phone!),
          ),

          const SizedBox(height: 8),

          // Secondary Phone
          if (owner.secondPhone != null)
            _ContactInfoRow(
              icon: Icons.phone_outlined,
              text: owner.secondPhone!,
              label: lang.secondaryPhone,
              onTap: () => _makePhoneCall(owner.secondPhone!),
            ),
        ],
      ),
    );
  }

  /// Action buttons section
  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              height: 42,
              text: "Show Details".tr,
              onPressed: () {},
            ),
          ),
          if (owner.phone != null) ...[
            const SizedBox(width: 10),
            _ActionButton(
              icon: Icons.call_outlined,
              color: Colors.green,
              onTap: () => _makePhoneCall(owner.phone!),
            ),
            const SizedBox(width: 10),
            _ActionButton(
              icon: MyFlutterApp.whatsapp,
              color: const Color(0xFF25D366),
              onTap: () => _openWhatsApp(owner.phone!),
            ),
          ],
        ],
      ),
    );
  }
}

/// Optimized contact info row - extracted as separate widget
class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? label;
  final VoidCallback? onTap;

  const _ContactInfoRow({
    required this.icon,
    required this.text,
    this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: secondaryTextColor),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        label!,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.grey.shade400,
              ),
          ],
        ),
      ),
    );
  }
}

/// Optimized action button - const constructor for better performance
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            border: Border.all(color: color.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
      ),
    );
  }
}

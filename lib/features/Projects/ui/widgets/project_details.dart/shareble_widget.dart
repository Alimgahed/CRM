import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/number_format.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/share_cubit/atttachment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ModernCard extends StatelessWidget {
  final Widget child;

  const ModernCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: isDark ? Colors.white : divColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black87,
      ),
    );
  }
}

class ModernInfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final Color? valueColor;

  const ModernInfoRow({
    super.key,
    required this.label,
    this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (value == null || value!.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: isDark ? Colors.white70 : secondaryTextColor,
              ),
            ),
          ),
          widthSpace(12),
          Expanded(
            flex: 3,
            child: Text(
              value!,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 13.sp,
                color: valueColor ?? (isDark ? Colors.white : Colors.black87),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentPlanCard extends StatelessWidget {
  final PlanDetail plan;

  const PaymentPlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );
    return Container(
      padding: EdgeInsets.all(14.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : containerColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: isDark ? Colors.white : divColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModernInfoRow(label: l10n.years, value: "${plan.noOfYears ?? '—'}"),
          ModernInfoRow(
            label: l10n.downPayment,
            value: plan.downPayment != null
                ? '${plan.downPayment.toPrice()} ${l10n.egp}'
                : '—',
          ),
          ModernInfoRow(
            label: l10n.yearlyInstallment,
            value: plan.yearlyInstallment != null
                ? '${plan.yearlyInstallment!.toPrice()} ${l10n.egp}'
                : '—',
          ),
          ModernInfoRow(
            label: l10n.discount,
            value: plan.discountPercent != null
                ? '${plan.discountPercent}%'
                : '—',
          ),
          if (plan.attachment != null) ...[
            heightSpace(8),
            AttachmentTile(attachment: plan.attachment!),
          ],
        ],
      ),
    );
  }
}

class AttachmentTile extends StatelessWidget {
  final Attachment attachment;

  const AttachmentTile({super.key, required this.attachment});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    final isImage = _isImageFile(attachment.fileType!);
    final isPdf = _isPdfFile(attachment.fileType!);

    return BlocBuilder<AttachmentCubit, AttachmentState>(
      builder: (context, state) {
        final isDownloading =
            state is AttachmentDownloading &&
            state.attachmentId == attachment.id;

        final progress = isDownloading ? (state).progress : 0.0;

        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: isDark ? darkFieldColor : containerColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: isDark ? Colors.white : divColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(14.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: appColor.withOpacity(isDark ? 0.2 : 0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        isImage
                            ? Icons.image_outlined
                            : isPdf
                            ? Icons.picture_as_pdf_outlined
                            : Icons.attach_file_outlined,
                        color: appColor,
                        size: 22.sp,
                      ),
                    ),
                    widthSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attachment.fileName!.isNotEmpty
                                ? attachment.fileName!
                                : l10n.attachment,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: isDark ? Colors.white : Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          heightSpace(4),
                          Text(
                            _formatFileSize(attachment!.fileSize!),
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: isDark
                                  ? Colors.white60
                                  : secondaryTextColor,
                            ),
                          ),
                          if (isDownloading) ...[
                            heightSpace(8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: LinearProgressIndicator(
                                value: progress,
                                backgroundColor: isDark
                                    ? Colors.grey.shade800
                                    : fieldColor,
                                valueColor: const AlwaysStoppedAnimation(
                                  appColor,
                                ),
                                minHeight: 4.h,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    widthSpace(8),
                    if (isDownloading)
                      SizedBox(
                        width: 24.sp,
                        height: 24.sp,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          value: progress,
                          valueColor: const AlwaysStoppedAnimation(appColor),
                        ),
                      )
                    else
                      IconButton(
                        icon: Icon(
                          Icons.download_outlined,
                          size: 22.sp,
                          color: appColor,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          context.read<AttachmentCubit>().downloadAttachment(
                            attachment,
                          );
                        },
                      ),
                  ],
                ),
              ),

              /// ===== Image Preview =====
              if (isImage && attachment.filePath!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: ApiConstants.baseUrl + attachment.filePath!,
                    width: double.infinity,
                    height: 180.h,
                    memCacheHeight: 400,
                    memCacheWidth: 400,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Shimmer.fromColors(
                      baseColor: isDark
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                      highlightColor: isDark
                          ? Colors.grey.shade700
                          : Colors.grey.shade100,
                      child: Container(
                        height: 180.h,
                        color: isDark ? Colors.grey.shade800 : Colors.grey,
                      ),
                    ),
                    errorWidget: (_, __, ___) => Container(
                      height: 180.h,
                      color: isDark ? const Color(0xFF2C2C2C) : fieldColor,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 40.sp,
                        color: isDark ? Colors.grey[600] : Colors.grey,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  /// ===== Helpers =====

  bool _isImageFile(String type) {
    final t = type.toLowerCase();
    return t.startsWith('image/') ||
        t.endsWith('png') ||
        t.endsWith('jpg') ||
        t.endsWith('jpeg') ||
        t.endsWith('webp');
  }

  bool _isPdfFile(String type) {
    final t = type.toLowerCase();
    return t == 'application/pdf' || t.endsWith('pdf');
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double standardPadding = 12.0;
const double itemSpacing = 10.0;
const double borderRadius = 10.0;

// Responsive text styles
TextStyle titleStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16.sp,
  height: 1.5,
  letterSpacing: -1,
);

TextStyle smallStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 10.sp,
  height: 1.5,
);

// // ignore: camel_case_types
// ignore: camel_case_types
class infoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  // Dictionary-match original function signature: infoChip(icon, text, color)
  const infoChip(this.icon, this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? darkFieldColor : const Color(0xFFF5F5F5);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15.sp, color: color),
          SizedBox(width: 5.w),
          Expanded(
            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                height: 1.5,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String statusText;
  final Color statusColor;

  const StatusChip({
    super.key,
    required this.statusText,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusText,
        style: TextStyles.size12(
          fontWeight: FontWeight.w600,
          color: statusColor,
        ),
      ),
    );
  }
}

// // ignore: camel_case_types
class buildInfoRow extends StatelessWidget {
  final String keyText; // renamed from 'key' to avoid collision with Widget.key
  final String value;
  final bool isLink;

  // Dictionary-match original function signature: buildInfoRow(key, value, {isLink})
  const buildInfoRow(
    this.keyText,
    this.value, {
    super.key,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final labelColor = isDark ? Colors.grey.shade400 : const Color(0xFF616161);
    final valueColor = isLink
        ? Colors.blue
        : (isDark ? Colors.white : Colors.black);

    final valueStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: valueColor,
      decoration: isLink ? TextDecoration.underline : null,
      decorationColor: isLink ? Colors.blue : null,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              keyText.tr,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: labelColor,
              ),
            ),
          ),
          SizedBox(width: itemSpacing.w),
          Expanded(
            flex: 2,
            child: Text(value, textAlign: TextAlign.end, style: valueStyle),
          ),
        ],
      ),
    );
  }
}

// // ignore: camel_case_types
class buildCard extends StatelessWidget {
  final Widget child;

  // Dictionary-match original function signature: buildCard({required child})
  const buildCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.grey.shade800 : const Color(0xFFE0E0E0);
    final backgroundColor = isDark
        ? const Color(0xFF1E1E1E)
        : Colors.transparent;

    return Container(
      padding: EdgeInsets.all(standardPadding.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius.r)),
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        color:
            backgroundColor, // Added background for better dark mode visibility
      ),
      child: child,
    );
  }
}

// // ignore: camel_case_types
class buildSectionTitle extends StatelessWidget {
  final String title;

  // Dictionary-match original function signature: buildSectionTitle(title)
  const buildSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    // Text color automatically adapts via Theme, but explicit check good for custom consistency
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? Colors.white : Colors.black;

    return Text(
      title.tr,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

enum FileType {
  pdf,
  doc,
  xls,
  image,
  other;

  IconData get icon {
    switch (this) {
      case FileType.pdf:
        return Icons.picture_as_pdf;
      case FileType.doc:
        return Icons.description;
      case FileType.xls:
        return Icons.table_chart;
      case FileType.image:
        return Icons.image;
      case FileType.other:
        return Icons.insert_drive_file;
    }
  }

  Color get color {
    switch (this) {
      case FileType.pdf:
        return Colors.red;
      case FileType.doc:
        return Colors.blue;
      case FileType.xls:
        return Colors.green;
      case FileType.image:
        return Colors.purple;
      case FileType.other:
        return Colors.grey;
    }
  }
}

class AttachmentItem extends StatelessWidget {
  final String fileName;
  final FileType fileType;

  const AttachmentItem({
    super.key,
    required this.fileName,
    required this.fileType,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final containerColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
    final textColor = isDark ? Colors.white : Colors.black;
    final iconColor = isDark ? Colors.grey.shade400 : null;

    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            Icon(fileType.icon, color: fileType.color, size: 28.sp),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                fileName,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download_outlined,
                size: 20.sp,
                color: iconColor,
              ),
              tooltip: 'Download',
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.visibility_outlined,
                size: 20.sp,
                color: iconColor,
              ),
              tooltip: 'View',
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    this.size,
    required this.value,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final String value;
  final double? size;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: appColor.withOpacity(0.7)),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$label: ",
                  style: TextStyle(
                    color: secondaryTextColor,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    color: isDark ? Colors.white : secondaryTextColor,
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SuccessBottomSheet extends StatelessWidget {
  const SuccessBottomSheet({
    super.key,
    required this.text,
    required this.text2,
    required this.success,
  });

  final String text;
  final String text2;
  final bool success;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FloatingCloseButton(),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: isDarkMode ? darkColor : Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: success ? successColor : warningColor,
                      shape: BoxShape
                          .circle, // Remove borderRadius when using circle
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    text,
                    style: TextStyles.size20().copyWith(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                        255,
                        222,
                        217,
                        217,
                      ).withOpacity(0.2),
                      shape: BoxShape.circle, // Remove borderRadius
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: success ? successColor : warningColor,
                      shape: BoxShape.circle, // Remove borderRadius
                    ),
                    child: Icon(
                      success ? Icons.check : Icons.error,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyles.size16().copyWith(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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

const Color _grey100 = Color(0xFFF5F5F5);
const Color _grey300 = Color(0xFFE0E0E0);

Widget infoChip(IconData icon, String text, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      color: _grey100,
    ),
    child: Row(
      children: [
        Icon(icon, size: 15.sp, color: color),
        SizedBox(width: 5.w),
        Text(text, style: smallStyle.copyWith(color: color)),
      ],
    ),
  );
}

Widget buildInfoRow(String key, String value, {bool isLink = false}) {
  final TextStyle valueStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: isLink ? Colors.blue : Colors.black,
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
            key.tr,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF616161),
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

/// Builds a styled container wrapper
Widget buildCard({required Widget child}) {
  return Container(
    padding: EdgeInsets.all(standardPadding.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius.r)),
      border: Border.fromBorderSide(BorderSide(color: _grey300)),
    ),
    child: child,
  );
}

/// Builds section title
Widget buildSectionTitle(String title) {
  return Text(
    title.tr,
    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
  );
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
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
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.download_outlined, size: 20.sp),
              tooltip: 'Download',
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility_outlined, size: 20.sp),
              tooltip: 'View',
            ),
          ],
        ),
      ),
    );
  }
}

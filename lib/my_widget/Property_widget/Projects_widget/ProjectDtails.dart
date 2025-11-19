import 'package:crm/gloable/Reusable_widget/gloable.dart';
import 'package:crm/my_widget/Property_widget/Gloable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Optimized Project Details Widget
/// - Reduced widget rebuilds
/// - Improved memory management
/// - Better code organization
class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  // ==================== Constants ====================
  


  // ==================== Reusable Components ====================

  /// Builds a key-value information row
  

  // ==================== Header Section ====================
  Widget _buildHeader() {
    return const Row(
      children: [
        Icon(Icons.business_outlined, size: 35),
        SizedBox(width: itemSpacing),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Marvel Palms",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 3),
            Text(
              "Commercial Project",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  // ==================== Details Section ====================
  Widget _buildDetailsSection() {
    return buildCard(
      child: Column(
        children: [
          buildInfoRow("Developer", "إمكان"),
          buildInfoRow("Project Code", "MARV-0032"),
          buildInfoRow("Agent Name", "محمد أحمد"),
          buildInfoRow("Agent Phone", "+201234567890"),
          buildInfoRow("Country", "مصر"),
          buildInfoRow("Governorate", "القاهرة الجديدة"),
          buildInfoRow(
            "Project Link",
            "مارفل بالمز (Marvel Palms)",
            isLink: true,
          ),
          buildInfoRow("Map Link", "مارفل بالمز (Marvel Palms)", isLink: true),
          buildInfoRow("Min Price", "١٬٢٠٠٬٠٠٠ جنيه"),
          buildInfoRow("Max Price", "٦٬٣٠٠٬٠٠٠ جنيه"),
          buildInfoRow("Min Area", "٦٠ م²"),
          buildInfoRow("Max Area", "١٢٠ م²"),
          buildInfoRow(
            "Project Description",
            "مشروع تجاري مميز يقع في قلب التجمع الخامس.",
          ),
        ],
      ),
    );
  }

  // ==================== Payment Plan Section ====================
  Widget _buildPaymentPlanSection() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle("Payment Plan"),
          const SizedBox(height: 8),
          ExpansionTile(
            iconColor: Colors.black,
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            title: const _PaymentPlanHeader(),
            children: [
              buildInfoRow("Spaces (from–to)", "٩٠ - ٢٠٠ م²"),
              buildInfoRow("Price per meter", "٥٬٠٠٠ - ٨٬٠٠٠ جنيه"),
              buildInfoRow("Installment Years", "٥ سنوات"),
              buildInfoRow("Down Payment", "٢٥٪"),
              buildInfoRow(
                "Plan Description",
                "خطة الاختيار الذكي تشمل ٢٥٪ مقدم وأقساط ربع سنوية لمدة ٥ سنوات. يوجد خصم ٦٪ للكاش.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMediaSection(List<String> media) { 
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('Images & Videos'),
          const SizedBox(height: itemSpacing),
          _MediaGrid(media: media),
        ],
      ),
    );
  }

  // ==================== Attachments Section ====================
  Widget _buildAttachmentsSection() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('Files and attachments'),
          const SizedBox(height: itemSpacing),
          const _AttachmentItem(
            fileName: "Project_Brochure.pdf",
            fileType: FileType.pdf,
          ),
        ],
      ),
    );
  }

  // ==================== Main Build ====================
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(standardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          _buildDetailsSection(),
          const SizedBox(height: itemSpacing),
          _buildPaymentPlanSection(),
          const SizedBox(height: itemSpacing),
          _buildMediaSection([
            "https://picsum.photos/200/300",
            "https://picsum.photos/200/301",
            "video.mp4",
            "https://picsum.photos/200/302",
            "https://picsum.photos/200/303",
            "https://picsum.photos/200/304",
            "https://picsum.photos/200/305",
            "https://picsum.photos/200/306",
            "https://picsum.photos/200/307",
          ]),
          const SizedBox(height: itemSpacing),
          _buildAttachmentsSection(),
        ],
      ),
    );
  }
}

// ==================== Extracted Widgets ====================

/// Payment Plan Header - extracted to const for performance
class _PaymentPlanHeader extends StatelessWidget {
  const _PaymentPlanHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.payment_outlined),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Smart Choice Plan",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              "13 December 2025",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}

/// Media Grid - optimized with caching and lazy loading
class _MediaGrid extends StatelessWidget {
  final List<String> media;

  const _MediaGrid({required this.media});

  bool _isVideo(String url) => url.toLowerCase().endsWith(".mp4");

  void _handleMediaTap(BuildContext context, String url, int index) {
    if (_isVideo(url)) {
    } else {
      Get.to(
        () => FullscreenImageViewer(
          images: media.where((m) => !_isVideo(m)).toList(),
          initialIndex: media.indexOf(url),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: media.length,
      itemBuilder: (context, index) {
        return MediaGridItem(
          url: media[index],
          isVideo: _isVideo(media[index]),
          onTap: () => _handleMediaTap(context, media[index], index),
        );
      },
    );
  }
}

/// Individual Media Grid Item - optimized with const constructor

/// File type enum for better type safety
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

class _AttachmentItem extends StatelessWidget {
  final String fileName;
  final FileType fileType;

  const _AttachmentItem({required this.fileName, required this.fileType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(fileType.icon, color: fileType.color, size: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                fileName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download_outlined),
              tooltip: 'Download',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_outlined),
              tooltip: 'View',
            ),
          ],
        ),
      ),
    );
  }
}

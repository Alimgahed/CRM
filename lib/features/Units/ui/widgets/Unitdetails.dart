import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Optimized Project Details Widget
/// - Reduced widget rebuilds
/// - Improved memory management
/// - Better code organization
class UnitDetails extends StatelessWidget {
  const UnitDetails({super.key});


  Widget _buildDetailsSection() {
    return buildCard(
      child: Column(
        children: [
          buildInfoRow("Unit Code", "A-116"),
          buildInfoRow("Unit Type", "سكني"),
          buildInfoRow("Elevator", "يوجد"),
          buildInfoRow("Total Land Area", "2500م²"),
          buildInfoRow("Building Area", "350م²"),
          buildInfoRow("Price per Meter", "8000 جنيه مصري"),
          buildInfoRow("Monthly Rent Value", "150000 جنيه مصري"),
          buildInfoRow("Total Price", "15000000 جنيه مصري"),
          buildInfoRow("Listing Type", "بيع"),
          buildInfoRow("Country", "مصر"),
          buildInfoRow("Governorate", "القاهرة"),
          buildInfoRow("City", "القاهرة الجديدة"),
          buildInfoRow("District", "التجمع الخامس"),
          buildInfoRow("Project", "ازدهار"),
          buildInfoRow("Sub Area", "اللوتس"),
          buildInfoRow("Street", "محمد علي بك"),
          buildInfoRow("Map Link", "A-116", isLink: true),
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
          buildSectionTitle("مكونات الوحدة"),
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
          const AttachmentItem(
            fileName: "Project_Brochure.pdf",
            fileType: FileType.pdf,
          ),
        ],
      ),
    );
  }
  // ignore: non_constant_identifier_names
  Widget _UnitComponentsSection() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('Unit Components'),
          const SizedBox(height: itemSpacing),
          buildInfoRow("Building Number", "2"),
          buildInfoRow("Floor", "2nd"),
          buildInfoRow("Bedrooms", "3"),
          buildInfoRow("Bathrooms", "2"),
          buildInfoRow("Area", "150 m²"),
          buildInfoRow("Finishing", "متشطب"),
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
          _buildDetailsSection(),
          const SizedBox(height: itemSpacing),
          _UnitComponentsSection(),
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


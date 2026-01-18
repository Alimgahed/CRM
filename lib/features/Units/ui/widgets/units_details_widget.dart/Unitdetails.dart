import 'package:crm/Core/widgets/Gloable_widget.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/features/Units/data/models/unit_model.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/component_card.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/details_section.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/floor_section.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/header_sections.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/info_details.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/location_section.dart';
import 'package:crm/features/Units/ui/widgets/units_details_widget.dart/price_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitDetails extends StatelessWidget {
  final Unit unit;
  const UnitDetails({super.key, required this.unit});

  // ==================== Floors Section ====================

  // ==================== Media Section ====================
  // Widget _buildMediaSection(List<String> media) {
  //   return buildCard(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         buildSectionTitle('الصور والفيديوهات'),
  //         const SizedBox(height: itemSpacing),
  //         _MediaGrid(media: media),
  //       ],
  //     ),
  //   );
  // }

  // ==================== Attachments Section ====================
  // Widget _buildAttachmentsSection() {
  //   return buildCard(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         buildSectionTitle('الملفات والمرفقات'),
  //         const SizedBox(height: itemSpacing),
  //         const AttachmentItem(
  //           fileName: "Unit_Details.pdf",
  //           fileType: FileType.pdf,
  //         ),
  //         const SizedBox(height: 8),
  //         const AttachmentItem(
  //           fileName: "Floor_Plans.pdf",
  //           fileType: FileType.pdf,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // ==================== IDs Section ====================

  // ==================== Main Build ====================
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(standardPadding),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnitHeaderSection(unit: unit),
            const SizedBox(height: itemSpacing),
            UnitPriceSection(unit: unit),
            const SizedBox(height: itemSpacing),
            UnitBasicDetailsSection(unit: unit),
            const SizedBox(height: itemSpacing),
            UnitLocationSection(unit: unit),
            const SizedBox(height: itemSpacing),
            UnitComponentsSection(unit: unit),
            const SizedBox(height: itemSpacing),
            UnitFloorsSection(unit: unit),
            const SizedBox(height: itemSpacing),
            // _buildMediaSection([
            //   "https://picsum.photos/200/300",
            //   "https://picsum.photos/200/301",
            //   "video.mp4",
            //   "https://picsum.photos/200/302",
            //   "https://picsum.photos/200/303",
            //   "https://picsum.photos/200/304",
            // ]),
            // const SizedBox(height: itemSpacing),
            // _buildAttachmentsSection(),
            // const SizedBox(height: itemSpacing),
            OwnerInfo(unit: unit),
          ],
        ),
      ),
    );
  }
}

// ==================== Media Grid Widget ====================
class _MediaGrid extends StatelessWidget {
  final List<String> media;

  const _MediaGrid({required this.media});

  bool _isVideo(String url) => url.toLowerCase().endsWith(".mp4");

  void _handleMediaTap(BuildContext context, String url, int index) {
    if (_isVideo(url)) {
      // Handle video playback
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
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
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



// //
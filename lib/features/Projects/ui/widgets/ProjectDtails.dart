// =============================================================
// 📄 project_details_screen.dart
// =============================================================
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';




// =============================================================
// 🎯 MAIN SCREEN
// =============================================================



// =============================================================
// 🎯 PROJECT HEADER WIDGET
// =============================================================
class ProjectHeader extends StatelessWidget {
  final ProjectResponse project;

  const ProjectHeader({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Row(
        children: [
          Icon(Icons.business_outlined, size: 36.sp, color: Colors.blue),
          widthSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.projectName ?? "No Name",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (project.projectNameEn?.isNotEmpty ?? false) ...[
                  heightSpace(4),
                  Text(
                    project.projectNameEn!,
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// 🎯 PROJECT DETAILS CARD WIDGET
// =============================================================
class ProjectDetailsCard extends StatelessWidget {
  final ProjectResponse project;

  const ProjectDetailsCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Project Information"),
          InfoRow(label: "Description", value: project.description),
          InfoRow(label: "Units", value: project.noUnits?.toString()),
          InfoRow(label: "Buildings", value: project.noBuildings?.toString()),
          InfoRow(label: "Total Area", value: project.totalArea?.toString()),
          InfoRow(label: "License No", value: project.licenseNo?.toString()),
          InfoRow(
            label: "License Date",
            value: project.licenseDate?.toString().split(" ").first,
          ),
        ],
      ),
    );
  }
}

// =============================================================
// 🎯 PROJECT PRICE SECTION WIDGET
// =============================================================
class ProjectPriceSection extends StatelessWidget {
  final ProjectResponse project;

  const ProjectPriceSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final priceCategories = [
      PriceCategory("Edary", project.edaryPriceFrom, project.edaryPriceTo),
      PriceCategory("Sakany", project.sakanyPriceFrom, project.sakanyPriceTo),
      PriceCategory("Medical", project.medicalPriceFrom, project.medicalPriceTo),
      PriceCategory("Commercial", project.commercialPriceFrom, project.commercialPriceTo),
    ];

    final validPrices = priceCategories.where((p) => p.hasValue).toList();

    if (validPrices.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Price Ranges"),
          ...validPrices.map((price) => PriceTile(category: price)),
        ],
      ),
    );
  }
}

// =============================================================
// 🎯 PRICE CATEGORY MODEL
// =============================================================
class PriceCategory {
  final String title;
  final dynamic from;
  final dynamic to;

  PriceCategory(this.title, this.from, this.to);

  bool get hasValue => from != null || to != null;

  String get displayValue => "${from ?? '—'} - ${to ?? '—'}";
}

// =============================================================
// 🎯 PRICE TILE WIDGET
// =============================================================
class PriceTile extends StatelessWidget {
  final PriceCategory category;

  const PriceTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: InfoRow(label: category.title, value: category.displayValue),
    );
  }
}

// =============================================================
// 🎯 PROJECT MEDIA SECTION WIDGET
// =============================================================
class ProjectMediaSection extends StatelessWidget {
  final ProjectResponse project;

  const ProjectMediaSection({super.key, required this.project});

  List<String> get _mediaUrls => [
        ...?project.projectImages?.map((e) => e.imageUrl ?? "").where((url) => url.isNotEmpty),
        ...?project.youtubeVideos?.map((e) => e.link ?? "").where((url) => url.isNotEmpty),
      ];

  @override
  Widget build(BuildContext context) {
    final media = _mediaUrls;
    if (media.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Media"),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: media.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6.w,
              mainAxisSpacing: 6.h,
            ),
            itemBuilder: (context, index) => MediaTile(url: media[index]),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// 🎯 MEDIA TILE WIDGET
// =============================================================
class MediaTile extends StatelessWidget {
  final String url;

  const MediaTile({super.key, required this.url});

  bool get _isVideo => url.toLowerCase().contains('youtube') || 
                       url.toLowerCase().endsWith('.mp4');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Implement media viewer
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: _isVideo ? _buildVideoThumbnail() : _buildImageThumbnail(),
      ),
    );
  }

  Widget _buildVideoThumbnail() {
    return Container(
      color: Colors.black54,
      child: Icon(
        Icons.play_circle_fill,
        color: Colors.white,
        size: 40.sp,
      ),
    );
  }

  Widget _buildImageThumbnail() {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(color: Colors.grey),
      ),
      errorWidget: (_, __, ___) => Container(
        color: Colors.grey.shade300,
        child: Icon(Icons.broken_image, color: Colors.grey.shade600),
      ),
    );
  }
}

// =============================================================
// 🎯 PROJECT ATTACHMENTS SECTION WIDGET
// =============================================================
class ProjectAttachmentsSection extends StatelessWidget {
  final ProjectResponse project;

  const ProjectAttachmentsSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final attachments = project.attachments;
    if (attachments == null || attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Attachments"),
          ...attachments.map((attachment) => AttachmentTile(attachment: attachment)),
        ],
      ),
    );
  }
}

// =============================================================
// 🎯 ATTACHMENT TILE WIDGET
// =============================================================
class AttachmentTile extends StatelessWidget {
  final dynamic attachment;

  const AttachmentTile({super.key, required this.attachment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, color: Colors.blue, size: 28.sp),
          widthSpace(10),
          Expanded(
            child: Text(
              attachment.fileName ?? "Unnamed File",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
          IconButton(
            icon: Icon(Icons.download, size: 22.sp),
            onPressed: () {
              // TODO: Implement download functionality
            },
          ),
        ],
      ),
    );
  }
}

// =============================================================
// 🎯 REUSABLE WIDGETS
// =============================================================

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String? value;

  const InfoRow({super.key, required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          widthSpace(8),
          Expanded(
            child: Text(
              value ?? "—",
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
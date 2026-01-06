import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/features/Projects/data/model/project_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


// =============================================================
// 🎯 MAIN DETAILS SCREEN
// =============================================================
class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.projectName),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            ProjectHeader(project: project),
            heightSpace(12),
            ProjectDetailsCard(project: project),
            heightSpace(12),
            ProjectPriceSection(project: project),
            heightSpace(12),
            ProjectMediaSection(project: project),
            heightSpace(12),
            ProjectDeveloperSection(project: project),
            heightSpace(12),
            ProjectPlansSection(project: project),
            heightSpace(12),
            ProjectStagesSection(project: project),
            heightSpace(12),
            ProjectAttachmentsSection(project: project),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 HEADER
///////////////////////////////////////////////////////////////////////////////
class ProjectHeader extends StatelessWidget {
  final Project project;

  const ProjectHeader({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Row(
        children: [
          Icon(Icons.apartment_rounded, size: 38.sp, color: Colors.blue),
          widthSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.projectName,
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                if (project.projectNameEn.isNotEmpty)
                  Text(
                    project.projectNameEn,
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 BASIC DETAILS
///////////////////////////////////////////////////////////////////////////////
class ProjectDetailsCard extends StatelessWidget {
  final Project project;

  const ProjectDetailsCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Project Information"),
          InfoRow(label: "Description", value: project.description),
          InfoRow(label: "Location", value: project.location),
          InfoRow(label: "Start Date", value: project.startDate),
          InfoRow(label: "End Date", value: project.endDate),
          InfoRow(label: "Status", value: project.status.toString()),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 PRICE & AREA
///////////////////////////////////////////////////////////////////////////////
class ProjectPriceSection extends StatelessWidget {
  final Project project;

  const ProjectPriceSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Price & Area"),
          InfoRow(
            label: "Meter Price",
            value:
                "${project.priceMmeterFrom ?? '—'} - ${project.priceMmeterTo ?? '—'}",
          ),
          InfoRow(
            label: "Area Range",
            value:
                "${project.areaFrom ?? '—'} m² - ${project.areaTo ?? '—'} m²",
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 PROJECT LOGO
///////////////////////////////////////////////////////////////////////////////
class ProjectMediaSection extends StatelessWidget {
  final Project project;

  const ProjectMediaSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    if (project.logoUrl == null || project.logoUrl!.isEmpty) {
      return const SizedBox.shrink();
    }

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Project Logo"),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: project.logoUrl!,
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.cover,
              placeholder: (_, __) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(height: 200.h, color: Colors.grey),
              ),
              errorWidget: (_, __, ___) => Container(
                height: 200.h,
                color: Colors.grey.shade200,
                child: Icon(Icons.error, size: 40.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 DEVELOPER COMPANY
///////////////////////////////////////////////////////////////////////////////
class ProjectDeveloperSection extends StatelessWidget {
  final Project project;

  const ProjectDeveloperSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final dev = project.devCompany;

    if (dev == null) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Developer Company"),
          InfoRow(label: "Arabic Name", value: dev.companyNameAr),
          InfoRow(label: "English Name", value: dev.companyNameEn),
          InfoRow(label: "Contact Person", value: dev.contactPerson),
          InfoRow(label: "Phone", value: dev.contactNumber),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 PROJECT PLAN SECTION
///////////////////////////////////////////////////////////////////////////////
class ProjectPlansSection extends StatelessWidget {
  final Project project;

  const ProjectPlansSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final plans = project.planDetails;
    if (plans == null || plans.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Payment Plans"),
          ...plans.map(
            (plan) => Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoRow(label: "Years", value: "${plan.noOfYears ?? '—'}"),
                  InfoRow(
                      label: "Down Payment",
                      value: "${plan.downPayment ?? '—'}"),
                  InfoRow(
                      label: "Yearly Installment",
                      value: "${plan.yearlyInstallment ?? '—'}"),
                  if (plan.attachment != null)
                    AttachmentTile(attachment: plan.attachment!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 PROJECT STAGES & GROUPS
///////////////////////////////////////////////////////////////////////////////
class ProjectStagesSection extends StatelessWidget {
  final Project project;

  const ProjectStagesSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final stages = project.projectStages;
    if (stages == null || stages.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Project Stages"),
          ...stages.map((stage) {
            return Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stage.stageName,
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                  heightSpace(8),
                  if (stage.groups != null)
                    ...stage.groups!.map(
                      (g) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 8.sp, color: Colors.blue),
                            widthSpace(6),
                            Text(g.stageCode,
                                style: TextStyle(fontSize: 12.sp)),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 PROJECT ATTACHMENTS
///////////////////////////////////////////////////////////////////////////////
class ProjectAttachmentsSection extends StatelessWidget {
  final Project project;

  const ProjectAttachmentsSection({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final attachments = project.attachments;

    if (attachments == null || attachments.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: "Attachments"),
          ...attachments.map((a) => AttachmentTile(attachment: a)),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
// 🎯 ATTACHMENT TILE
///////////////////////////////////////////////////////////////////////////////
class AttachmentTile extends StatelessWidget {
  final Attachment attachment;

  const AttachmentTile({super.key, required this.attachment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_file, color: Colors.blue, size: 24.sp),
          widthSpace(10),
          Expanded(
            child: Text(
              attachment.fileName,
              style: TextStyle(fontSize: 13.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.download, size: 22.sp),
        ],
      ),
    );
  }
}

// =============================================================
// SHARED REUSABLE WIDGETS
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
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
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
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp)),
          ),
          Expanded(
            child: Text(
              value ?? "—",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
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
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(
        title,
        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}

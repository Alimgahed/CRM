// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:crm/Core/helpers/number_format.dart';
// import 'package:crm/Core/helpers/spacing.dart';
// import 'package:crm/Core/network/api_constants.dart';
// import 'package:crm/features/Projects/data/model/projects_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';
// import 'dart:io';

// // 🎯 MAIN DETAILS SCREEN

// class ProjectDetailsScreen extends StatelessWidget {
//   final Project project;

//   const ProjectDetailsScreen({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     // Extract project from arguments if passed via Navigator
//     final Project projectArg =
//         ModalRoute.of(context)?.settings.arguments as Project? ?? project;

//     return Scaffold(
//       appBar: AppBar(title: Text(projectArg.projectName)),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(12.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ProjectHeader(project: projectArg),
//             heightSpace(16),
//             ProjectDetailsCard(project: projectArg),
//             heightSpace(16),
//             ProjectPriceSection(project: projectArg),
//             heightSpace(16),
//             ProjectDeveloperSection(project: projectArg),
//             heightSpace(16),
//             ProjectPlansSection(project: projectArg),
//             heightSpace(16),
//             ProjectStagesSection(project: projectArg),
//             heightSpace(16),
//             ProjectAttachmentsSection(project: projectArg),
//             heightSpace(16),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 HEADER
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectHeader extends StatelessWidget {
//   final Project project;

//   const ProjectHeader({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return CardContainer(
//       child: Row(
//         children: [
//           Icon(Icons.apartment_rounded, size: 38.sp, color: Colors.blue),
//           widthSpace(12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   project.projectName,
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 if (project.projectNameEn.isNotEmpty)
//                   Text(
//                     project.projectNameEn,
//                     style: TextStyle(fontSize: 13.sp, color: Colors.grey),
//                   ),
//                 if (project.projectPrefix != null)
//                   Text(
//                     'Prefix: ${project.projectPrefix}',
//                     style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 BASIC DETAILS
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectDetailsCard extends StatelessWidget {
//   final Project project;

//   const ProjectDetailsCard({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return CardContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(title: "Project Information"),
//           InfoRow(label: "Description", value: project.description),
//           InfoRow(label: "Location", value: project.location),
//           InfoRow(label: "Contact Person", value: project.contactPerson),
//           InfoRow(label: "Contact Number", value: project.contactNumber),
//           InfoRow(
//             label: "Project Type",
//             value: project.projectType != null
//                 ? _getProjectTypeLabel(project.projectType!)
//                 : null,
//           ),
//           InfoRow(label: "Plan Description", value: project.planDescription),
//         ],
//       ),
//     );
//   }

//   String _getProjectTypeLabel(int type) {
//     switch (type) {
//       case 1:
//         return 'Residential';
//       case 2:
//         return 'Commercial';
//       case 3:
//         return 'Mixed Use';
//       default:
//         return 'Type $type';
//     }
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 PRICE & AREA
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectPriceSection extends StatelessWidget {
//   final Project project;

//   const ProjectPriceSection({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return CardContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(title: "Price & Area"),
//           InfoRow(
//             label: "Meter Price",
//             value:
//                 "${project.priceMmeterFrom.toPrice()} - ${project.priceMmeterTo.toPrice()} ",
//           ),
//           InfoRow(
//             label: "Area Range",
//             value:
//                 "${project.areaFrom ?? '—'} m² - ${project.areaTo ?? '—'} m²",
//           ),
//         ],
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 DEVELOPER COMPANY
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectDeveloperSection extends StatelessWidget {
//   final Project project;

//   const ProjectDeveloperSection({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final dev = project.devCompany;

//     if (dev == null) return const SizedBox.shrink();

//     return CardContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(title: "Developer Company"),
//           if (dev.logoUrl != null && dev.logoUrl!.isNotEmpty)
//             Padding(
//               padding: EdgeInsets.only(bottom: 12.h),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: CachedNetworkImage(
//                   imageUrl: ApiConstants.baseUrl + dev.logoUrl!,
//                   height: 100.h,
//                   width: double.infinity,
//                   fit: BoxFit.contain,
//                   placeholder: (_, __) => Shimmer.fromColors(
//                     baseColor: Colors.grey.shade300,
//                     highlightColor: Colors.grey.shade100,
//                     child: Container(height: 100.h, color: Colors.grey),
//                   ),
//                   errorWidget: (_, __, ___) => Container(
//                     height: 100.h,
//                     color: Colors.grey.shade200,
//                     child: Icon(Icons.error, size: 40.sp),
//                   ),
//                 ),
//               ),
//             ),
//           InfoRow(label: "Arabic Name", value: dev.companyNameAr),
//           InfoRow(label: "English Name", value: dev.companyNameEn),
//           InfoRow(label: "Contact Person", value: dev.contactPerson),
//           InfoRow(label: "Phone", value: dev.contactNumber),
//           InfoRow(
//             label: "Status",
//             value: (dev.isActive ?? false) ? 'Active' : 'Inactive',
//           ),
//         ],
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 PROJECT PLAN SECTION
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectPlansSection extends StatelessWidget {
//   final Project project;

//   const ProjectPlansSection({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final plans = project.planDetails;
//     if (plans == null || plans.isEmpty) return const SizedBox.shrink();

//     return CardContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(title: "Payment Plans"),
//           ...plans.map(
//             (plan) => Container(
//               padding: EdgeInsets.all(10.w),
//               margin: EdgeInsets.only(bottom: 10.h),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade300),
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InfoRow(label: "Years", value: "${plan.noOfYears ?? '—'}"),
//                   InfoRow(
//                     label: "Down Payment",
//                     value: plan.downPayment != null
//                         ? '${plan.downPayment.toPrice()} EGP'
//                         : '—',
//                   ),
//                   InfoRow(
//                     label: "Yearly Installment",
//                     value: plan.yearlyInstallment != null
//                         ? '${plan.yearlyInstallment!.toPrice()} EGP'
//                         : '—',
//                   ),
//                   InfoRow(
//                     label: "Discount",
//                     value: plan.discountPercent != null
//                         ? '${plan.discountPercent}%'
//                         : '—',
//                   ),
//                   if (plan.attachment != null)
//                     AttachmentTile(attachment: plan.attachment!),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 PROJECT STAGES & GROUPS
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectStagesSection extends StatelessWidget {
//   final Project project;

//   const ProjectStagesSection({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final stages = project.projectStages;
//     if (stages == null || stages.isEmpty) return const SizedBox.shrink();

//     return CardContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(title: "Project Stages"),
//           ...stages.map((stage) {
//             return Container(
//               padding: EdgeInsets.all(10.w),
//               margin: EdgeInsets.only(bottom: 10.h),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     stage.stageName,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   heightSpace(8),
//                   if (stage.groups != null && stage.groups!.isNotEmpty)
//                     ...stage.groups!.map(
//                       (g) => Padding(
//                         padding: EdgeInsets.symmetric(vertical: 4.h),
//                         child: Row(
//                           children: [
//                             Icon(Icons.circle, size: 8.sp, color: Colors.blue),
//                             widthSpace(6),
//                             Text(
//                               g.stageCode,
//                               style: TextStyle(fontSize: 12.sp),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 PROJECT ATTACHMENTS
// ///////////////////////////////////////////////////////////////////////////////
// class ProjectAttachmentsSection extends StatelessWidget {
//   final Project project;

//   const ProjectAttachmentsSection({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final attachments = project.attachments;

//     if (attachments == null || attachments.isEmpty) {
//       return const SizedBox.shrink();
//     }

//     return CardContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SectionTitle(title: "Attachments"),
//           ...attachments.map((a) => AttachmentTile(attachment: a)),
//         ],
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////
// // 🎯 ATTACHMENT TILE
// ///////////////////////////////////////////////////////////////////////////////

// class AttachmentTile extends StatefulWidget {
//   final Attachment attachment;

//   const AttachmentTile({super.key, required this.attachment});

//   @override
//   State<AttachmentTile> createState() => _AttachmentTileState();
// }

// class _AttachmentTileState extends State<AttachmentTile> {
//   bool _isDownloading = false;
//   double _downloadProgress = 0.0;

//   @override
//   Widget build(BuildContext context) {
//     final isImage = widget.attachment.fileType?.startsWith('image/') ?? false;
//     final isPdf = widget.attachment.fileType == 'application/pdf';

//     return Container(
//       padding: EdgeInsets.all(10.w),
//       margin: EdgeInsets.only(bottom: 8.h),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(10.r),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(
//                 isImage
//                     ? Icons.image
//                     : isPdf
//                     ? Icons.picture_as_pdf
//                     : Icons.attach_file,
//                 color: Colors.blue,
//                 size: 24.sp,
//               ),
//               widthSpace(10),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.attachment.fileName.isNotEmpty
//                           ? widget.attachment.fileName
//                           : 'Attachment',
//                       style: TextStyle(fontSize: 13.sp),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     if (widget.attachment.fileSize != null)
//                       Text(
//                         _formatFileSize(widget.attachment.fileSize!),
//                         style: TextStyle(fontSize: 11.sp, color: Colors.grey),
//                       ),
//                     if (_isDownloading)
//                       Padding(
//                         padding: EdgeInsets.only(top: 4.h),
//                         child: LinearProgressIndicator(
//                           value: _downloadProgress,
//                           backgroundColor: Colors.grey.shade200,
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                             Colors.blue,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//               _isDownloading
//                   ? SizedBox(
//                       width: 24.sp,
//                       height: 24.sp,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         value: _downloadProgress,
//                       ),
//                     )
//                   : IconButton(
//                       icon: Icon(Icons.download, size: 22.sp),
//                       onPressed: () => _downloadFile(context),
//                       padding: EdgeInsets.zero,
//                       constraints: BoxConstraints(),
//                     ),
//             ],
//           ),
//           // Show image preview if it's an image
//           if (isImage && widget.attachment.filePath.isNotEmpty)
//             Padding(
//               padding: EdgeInsets.only(top: 8.h),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8.r),
//                 child: CachedNetworkImage(
//                   imageUrl: ApiConstants.baseUrl + widget.attachment.filePath,
//                   width: double.infinity,
//                   height: 150.h,
//                   fit: BoxFit.cover,
//                   placeholder: (_, __) => Shimmer.fromColors(
//                     baseColor: Colors.grey.shade300,
//                     highlightColor: Colors.grey.shade100,
//                     child: Container(height: 150.h, color: Colors.grey),
//                   ),
//                   errorWidget: (_, __, ___) => Container(
//                     height: 150.h,
//                     color: Colors.grey.shade200,
//                     child: Icon(Icons.error, size: 40.sp),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Future<void> _downloadFile(BuildContext context) async {
//     setState(() {
//       _isDownloading = true;
//       _downloadProgress = 0.0;
//     });

//     try {
//       // Get file name
//       String fileName = widget.attachment.fileName.isNotEmpty
//           ? widget.attachment.fileName
//           : 'attachment_${DateTime.now().millisecondsSinceEpoch}';

//       String filePath;

//       if (Platform.isAndroid) {
//         // For Android, save to public Downloads folder
//         final downloadsPath = '/storage/emulated/0/Download';
//         filePath = '$downloadsPath/$fileName';
//       } else {
//         // For iOS, use documents directory
//         final directory = await getApplicationDocumentsDirectory();
//         filePath = '${directory.path}/$fileName';
//       }

//       // Download the file
//       final dio = Dio();
//       await dio.download(
//         ApiConstants.baseUrl + widget.attachment.filePath,
//         filePath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             setState(() {
//               _downloadProgress = received / total;
//             });
//           }
//         },
//       );

//       setState(() {
//         _isDownloading = false;
//         _downloadProgress = 0.0;
//       });

//       // Show success message
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('File downloaded to Downloads folder'),
//             action: SnackBarAction(
//               label: 'Open',
//               onPressed: () => _openFile(filePath),
//             ),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _isDownloading = false;
//         _downloadProgress = 0.0;
//       });

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Download failed: ${e.toString()}'),
//             backgroundColor: Colors.red,
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     }
//   }

//   Future<void> _openFile(String filePath) async {
//     try {
//       final result = await OpenFile.open(filePath);
//       if (result.type != ResultType.done) {
//         debugPrint('Error opening file: ${result.message}');
//       }
//     } catch (e) {
//       debugPrint('Error opening file: $e');
//     }
//   }

//   String _formatFileSize(int bytes) {
//     if (bytes < 1024) return '$bytes B';
//     if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
//     return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
//   }
// }

// // =============================================================
// // SHARED REUSABLE WIDGETS
// // =============================================================
// class CardContainer extends StatelessWidget {
//   final Widget child;

//   const CardContainer({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12.r),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 1)),
//         ],
//       ),
//       child: child,
//     );
//   }
// }

// class InfoRow extends StatelessWidget {
//   final String label;
//   final String? value;

//   const InfoRow({super.key, required this.label, this.value});

//   @override
//   Widget build(BuildContext context) {
//     if (value == null || value!.isEmpty) return const SizedBox.shrink();

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 6.h),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               label,
//               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value ?? "—",
//               textAlign: TextAlign.end,
//               style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SectionTitle extends StatelessWidget {
//   final String title;

//   const SectionTitle({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 10.h),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

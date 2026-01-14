import 'package:crm/Core/network/api_constants.dart';
import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:crm/features/Projects/ui/widgets/project_details.dart/shareble_widget.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:crm/features/share_cubit/atttachment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAttachment extends StatelessWidget {
  final List<Attachment> attachments;

  const ClientAttachment({super.key, required this.attachments});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    if (attachments.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Text(
          'No attachments found',
          style: TextStyle(color: secondaryTextColor),
        ),
      );
    }

    return BlocProvider(
      create: (context) => AttachmentCubit(baseUrl: ApiConstants.baseUrl),
      child: BlocListener<AttachmentCubit, AttachmentState>(
        listener: (context, state) {
          if (state is AttachmentDownloadSuccess) {
            // Store references before showing banner
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            final attachmentCubit = context.read<AttachmentCubit>();
            final filePath = state.filePath;
            final message = appLocalizations.fileDownloadedToDownloads;
            final openText = appLocalizations.open;

            scaffoldMessenger.showMaterialBanner(
              MaterialBanner(
                backgroundColor: appColor,
                content: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      attachmentCubit.openFile(filePath);
                      scaffoldMessenger.hideCurrentMaterialBanner();
                    },
                    child: Text(
                      openText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      scaffoldMessenger.hideCurrentMaterialBanner();
                    },
                  ),
                ],
              ),
            );

            // Auto-dismiss after 3 seconds using stored reference
            Future.delayed(const Duration(seconds: 3), () {
              scaffoldMessenger.hideCurrentMaterialBanner();
            });
          } else if (state is AttachmentDownloadError) {
            // Store reference before showing snackbar
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            final message = state.message.isNotEmpty
                ? '${appLocalizations.downloadFailed}: ${state.message}'
                : appLocalizations.downloadFailed;

            scaffoldMessenger.showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: warningColor,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: attachments.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return AttachmentTile(attachment: attachments[index]);
            },
          ),
        ),
      ),
    );
  }
}

import 'package:crm/features/Projects/data/model/projects_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

// =============================================================
// CUBIT STATE
// =============================================================
abstract class ProjectDetailsState {}

class ProjectDetailsInitial extends ProjectDetailsState {}

class ProjectDetailsLoading extends ProjectDetailsState {}

class ProjectDetailsLoaded extends ProjectDetailsState {
  final Project project;
  ProjectDetailsLoaded(this.project);
}

class ProjectDetailsError extends ProjectDetailsState {
  final String message;
  ProjectDetailsError(this.message);
}

// Attachment download states
class AttachmentDownloading extends ProjectDetailsState {
  final String attachmentId;
  final double progress;
  AttachmentDownloading(this.attachmentId, this.progress);
}

class AttachmentDownloadSuccess extends ProjectDetailsState {
  final String filePath;
  final String message;
  AttachmentDownloadSuccess(this.filePath, this.message);
}

class AttachmentDownloadError extends ProjectDetailsState {
  final String message;
  AttachmentDownloadError(this.message);
}

// =============================================================
// CUBIT
// =============================================================
class ProjectDetailsCubit extends Cubit<ProjectDetailsState> {
  final Dio _dio;
  final String baseUrl;

  ProjectDetailsCubit({required this.baseUrl, Dio? dio})
    : _dio = dio ?? Dio(),
      super(ProjectDetailsInitial());

  // Load project details
  void loadProject(Project project) {
    emit(ProjectDetailsLoaded(project));
  }

  // Download attachment
  Future<void> downloadAttachment(Attachment attachment) async {
    try {
      // Generate file name
      String fileName = attachment.fileName.isNotEmpty
          ? attachment.fileName
          : 'attachment_${DateTime.now().millisecondsSinceEpoch}';

      String filePath;

      if (Platform.isAndroid) {
        final downloadsPath = '/storage/emulated/0/Download';
        filePath = '$downloadsPath/$fileName';
      } else {
        final directory = await getApplicationDocumentsDirectory();
        filePath = '${directory.path}/$fileName';
      }

      // Start download with progress
      await _dio.download(
        baseUrl + attachment.filePath,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            emit(AttachmentDownloading(attachment.attachmentId, progress));
          }
        },
      );

      // Success message based on locale
      final message = 'File downloaded to Downloads folder';

      emit(AttachmentDownloadSuccess(filePath, message));
    } catch (e) {
      final message = 'Download failed: ${e.toString()}';

      emit(AttachmentDownloadError(message));
    }
  }

  // Open file
  Future<void> openFile(String filePath) async {
    try {
      await OpenFile.open(filePath);
    } catch (e) {
      print('Error opening file: $e');
    }
  }

  // Reset to loaded state
  void resetToLoaded(Project project) {
    emit(ProjectDetailsLoaded(project));
  }
}

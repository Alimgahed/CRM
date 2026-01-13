// controllers/file_upload_controller.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;

class FileUploadController extends GetxController {
  var isUploading = false.obs;
  var uploadProgress = 0.0.obs;
  var selectedFile = Rxn<File>();
  var uploadStatus = ''.obs;

  final Dio _dio = Dio();

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'xlsx', 'xls', 'doc', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      selectedFile.value = File(result.files.single.path!);
      uploadStatus.value = '';
      uploadProgress.value = 0.0;
    }
  }

  Future<void> uploadFile() async {
    final file = selectedFile.value;
    if (file == null) {
      uploadStatus.value = 'No file selected';
      return;
    }

    try {
      isUploading.value = true;
      uploadProgress.value = 0.0;

      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      });

      // Example: change this to your backend upload URL
      const uploadUrl = 'https://example.com/api/upload';

      await _dio.post(
        uploadUrl,
        data: formData,
        onSendProgress: (sent, total) {
          uploadProgress.value = total > 0 ? sent / total : 0.0;
        },
      );

      uploadStatus.value = '✅ File uploaded successfully!';
    } catch (e) {
      uploadStatus.value = '❌ Upload failed: $e';
    } finally {
      isUploading.value = false;
    }
  }
}

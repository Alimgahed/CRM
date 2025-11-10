// views/file_upload_screen.dart
import 'package:crm/controller/Features/add_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileUploadScreen extends StatelessWidget {
  const FileUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FileUploadController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload File'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Select File Button
              ElevatedButton.icon(
                onPressed:
                    controller.isUploading.value ? null : controller.pickFile,
                icon: const Icon(Icons.attach_file),
                label: const Text('Select File'),
              ),

              const SizedBox(height: 16),

              // Selected File Info
              if (controller.selectedFile.value != null)
                Text(
                  'Selected: ${controller.selectedFile.value!.path.split('/').last}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),

              const SizedBox(height: 24),

              // Upload Button
              ElevatedButton.icon(
                onPressed: controller.isUploading.value
                    ? null
                    : controller.uploadFile,
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Upload File'),
              ),

              const SizedBox(height: 30),

              // Upload Progress
              if (controller.isUploading.value)
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: controller.uploadProgress.value,
                      minHeight: 10,
                      color: Colors.blueAccent,
                      backgroundColor: Colors.blue.shade100,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(controller.uploadProgress.value * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

              const SizedBox(height: 20),

              // Upload Status Message
              if (controller.uploadStatus.isNotEmpty)
                Text(
                  controller.uploadStatus.value,
                  style: TextStyle(
                    color: controller.uploadStatus.value.startsWith('✅')
                        ? Colors.green
                        : Colors.red,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

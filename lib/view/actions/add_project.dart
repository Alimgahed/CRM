// views/file_upload_screen.dart
import 'package:crm/controller/Features/add_files.dart';
import 'package:crm/gloable/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileUploadScreen extends StatelessWidget {
  final String text;
  const FileUploadScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FileUploadController());

    return SingleChildScrollView(
      child: Column(
        children: [
          const FloatingCloseButton(),

          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              child: Obx(() {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    // Header
                    Row(
                      children: [
                        const Icon(Icons.contact_emergency_outlined),
                        const SizedBox(width: 8),
                        Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Text(
                    //   "أضف مستنداتك هنا ، ويمكنك تحميل ما يصل إلى 5 ملفات كحد أقصى",
                    //   style: TextStyle(color: Color(0xFF707070)),
                    // ),
                    // const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () async {
                        await controller.pickFile();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        margin: const EdgeInsets.all(8), // space outside border

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(77, 182, 229, 246),
                          border: Border.all(
                            color: const Color.fromARGB(77, 157, 222, 246),
                            width: 2,
                          ),
                          // To get space between the border and the inner content, add padding on the Container:
                          // padding: const EdgeInsets.all(12),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              const Icon(
                                Icons.upload_file_outlined,
                                size: 50,
                                color: Color.fromARGB(255, 0, 174, 239),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Upload Files'.tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (controller.selectedFile.value != null)
                      Text(
                        'Selected: ${controller.selectedFile.value!.path.split('/').last}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    const SizedBox(height: 24),

                    // Upload Button
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

                    const SizedBox(height: 16),

                    CustomButton(
                      text: "Save".tr,
                      onPressed: () {
                        controller.uploadFile();
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

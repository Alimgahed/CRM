import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddClientCubit extends Cubit<void> {
  AddClientCubit() : super(null);

  final clientNameController = TextEditingController();
  final assignedToController = TextEditingController();
  final expirationDateController = TextEditingController();
  final phoneController = TextEditingController();
  final phoneController2 = TextEditingController();

  final taskDescriptionController = TextEditingController();
  final emailController = TextEditingController();

  String projectName = '';
  String channel = '';
  String preferredMethod = '';
  String clientStatus = '';
  String taskPriority = '';

  void rebuild() => emit(null);

  void saveTask(BuildContext context) {
    final task = {
      'clientName': clientNameController.text,
      'assignedTo': assignedToController.text,
      'expirationDate': expirationDateController.text,
      'description': taskDescriptionController.text,
      'email': emailController.text,
      'projectName': projectName,
      'priority': taskPriority,
      'channel': channel,
      'preferredMethod': preferredMethod,
      'clientStatus': clientStatus,
    };

    debugPrint('✅ Task saved: $task');
    Navigator.pop(context);
  }

  @override
  Future<void> close() {
    print('✅ Task closed');
    clientNameController.dispose();
    assignedToController.dispose();
    expirationDateController.dispose();
    taskDescriptionController.dispose();
    phoneController.dispose();
    phoneController2.dispose();
    emailController.dispose();
    return super.close();
  }
}

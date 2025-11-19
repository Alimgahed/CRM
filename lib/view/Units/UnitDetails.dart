import 'package:crm/my_widget/Property_widget/Unit_Widget/Unitdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class UnitDetailsScreen extends StatelessWidget {
  const UnitDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unit Details'.tr)),
      body: SingleChildScrollView(child: UnitDetails()),
    );
  }
}

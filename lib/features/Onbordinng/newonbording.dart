import 'package:crm/features/Onbordinng/widgets/doclogoandname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Newonbording extends StatelessWidget {
  const Newonbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      SingleChildScrollView(child: Padding(
        padding:  EdgeInsets.only(top:  30.0.h,bottom: 30.h),
        child: Column(children: [
          Doclogoandname()
          
        ],),
      ))),
    );
  }
}

import 'package:flutter/material.dart';

class StageItem {
  final String title;
  final int count;
  final double percentage;

  StageItem({
    required this.title,
    required this.count,
    required this.percentage,
  });
}

class TotalItem {
  final String title;
  final String? amount;
  final double? ratio;

  TotalItem({required this.title, this.amount, this.ratio});
}

class DialogItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DialogItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}

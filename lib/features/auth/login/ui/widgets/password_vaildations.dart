import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({super.key, required this.haslowercase, required this.hasuppercase, required this.hasnumber, required this.hasspecialchar, required this.hasminlength});
  final bool haslowercase;
  final bool hasuppercase;
  final bool hasnumber;
  final bool hasspecialchar;
  final bool hasminlength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(haslowercase ? Icons.check : Icons.close, color: haslowercase ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            const Text('At least one lowercase letter'),
          ],
        ),
        Row(
          children: [
            Icon(hasuppercase ? Icons.check : Icons.close, color: hasuppercase ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            const Text('At least one uppercase letter'),
          ],
        ),
        Row(
          children: [
            Icon(hasnumber ? Icons.check : Icons.close, color: hasnumber ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            const Text('At least one number'),
          ],
        ),
        Row(
          children: [
            Icon(hasspecialchar ? Icons.check : Icons.close, color: hasspecialchar ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            const Text('At least one special character'),
          ],
        ),
        Row(
          children: [
            Icon(hasminlength ? Icons.check : Icons.close, color: hasminlength ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            const Text('At least 8 characters'),
          ],
        ),
      ],
    );
  }
}
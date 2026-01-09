import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.haslowercase,
    required this.hasuppercase,
    required this.hasnumber,
    required this.hasspecialchar,
    required this.hasminlength,
  });

  final bool haslowercase;
  final bool hasuppercase;
  final bool hasnumber;
  final bool hasspecialchar;
  final bool hasminlength;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        _buildValidationRow(
          haslowercase,
          'At least one lowercase letter',
          isDark,
        ),
        _buildValidationRow(
          hasuppercase,
          'At least one uppercase letter',
          isDark,
        ),
        _buildValidationRow(hasnumber, 'At least one number', isDark),
        _buildValidationRow(
          hasspecialchar,
          'At least one special character',
          isDark,
        ),
        _buildValidationRow(hasminlength, 'At least 8 characters', isDark),
      ],
    );
  }

  Widget _buildValidationRow(bool isValid, String text, bool isDark) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
      ],
    );
  }
}

import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    // OPTIMIZATION 1: Cache theme check
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // OPTIMIZATION 2: Use select instead of watch
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Column(
      mainAxisSize: MainAxisSize.min, // OPTIMIZATION 3: Minimize space
      children: [
        _ValidationRow(
          isValid: haslowercase,
          text: lang.atLeastOneLowercaseLetter,
          isDark: isDark,
        ),
        _ValidationRow(
          isValid: hasuppercase,
          text: lang.atLeastOneUppercaseLetter,
          isDark: isDark,
        ),
        _ValidationRow(
          isValid: hasnumber,
          text: lang.atLeastOneNumber,
          isDark: isDark,
        ),
        _ValidationRow(
          isValid: hasspecialchar,
          text: lang.atLeastOneSpecialCharacter,
          isDark: isDark,
        ),
        _ValidationRow(
          isValid: hasminlength,
          text: lang.atLeast8Characters,
          isDark: isDark,
        ),
      ],
    );
  }
}

// OPTIMIZATION 4: Extract to separate widget for better performance
class _ValidationRow extends StatelessWidget {
  const _ValidationRow({
    required this.isValid,
    required this.text,
    required this.isDark,
  });

  final bool isValid;
  final String text;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min, // OPTIMIZATION 5: Use minimum space
        children: [
          // OPTIMIZATION 6: Use AnimatedSwitcher for smooth icon transitions
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            child: Icon(
              isValid ? Icons.check_circle : Icons.cancel,
              key: ValueKey(isValid), // Key for animation
              color: isValid ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          // OPTIMIZATION 7: Use Flexible to prevent overflow
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
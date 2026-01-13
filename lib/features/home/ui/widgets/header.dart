import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/dark_cubit.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  const HeaderWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _UserInfo(userName: userName),
        const SizedBox(height: 16),
        const _SearchBar(), // Optimized with const
      ],
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String userName;
  const _UserInfo({required this.userName});

  @override
  Widget build(BuildContext context) {
    // Optimization: Grabbing values once at the top of build
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;

    final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Row(
      children: [
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Safe top spacing instead of hardcoded 30
            SizedBox(height: MediaQuery.of(context).padding.top + 10),
            Text(
              appLocalizations.welcome,
              style: TextStyles.size14(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              userName,
              style: TextStyles.size20(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const Spacer(),

        // Theme Toggle
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            final isDarkTheme = themeMode == ThemeMode.dark;
            return IconButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  isDarkTheme ? Icons.light_mode : Icons.dark_mode_outlined,
                  key: ValueKey(isDarkTheme),
                  color: textColor,
                  size: 26,
                ),
              ),
            );
          },
        ),

        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined, color: textColor, size: 26),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Get localization here too if needed, or pass it down
    final currentLocale = context.select((LocaleCubit c) => c.currentLocale);
    final loc = AppLocalizations(currentLocale);

    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDark ? darkColor2 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.35 : 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: TextStyles.size16(color: isDark ? Colors.white : appColor),
        decoration: InputDecoration(
          hintText:
              loc.search, // Fixed: Use Bloc/AppLocalizations instead of .tr
          hintStyle: TextStyles.size14(color: secondaryTextColor),
          prefixIcon: Icon(Icons.search, color: secondaryTextColor),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}

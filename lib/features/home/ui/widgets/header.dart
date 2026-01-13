import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/dark_cubit.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Widget buildHeader(BuildContext context, String userName) {
  return Column(
    children: [
      _buildUserInfo(context, userName),
      const SizedBox(height: 16),
      _buildSearchBar(context),
    ],
  );
}

Widget _buildUserInfo(BuildContext context, String userName) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  final appLocalizations = context.select<LocaleCubit, AppLocalizations>(
    (cubit) => AppLocalizations(cubit.currentLocale),
  );

  final Color textColor = isDark ? Colors.white : Colors.black;

  return Row(
    children: [
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
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

      /// Theme toggle
      BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final isDark = themeMode == ThemeMode.dark;
          return IconButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode_outlined,
                key: ValueKey(isDark),
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

Widget _buildSearchBar(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Container(
    height: 48,
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
        fillColor: isDark ? darkColor2 : Colors.white,
        hintText: "Search".tr,
        hintStyle: TextStyles.size14(color: secondaryTextColor),
        prefixIcon: Icon(Icons.search, color: secondaryTextColor),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  );
}

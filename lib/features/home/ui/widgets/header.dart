import 'package:crm/Core/theming/dark_cubit.dart';
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
  final appLocalizations = AppLocalizations(
    context.watch<LocaleCubit>().currentLocale,
  );

  return Row(
    children: [
      // const CircleAvatar(backgroundColor: Colors.white, radius: 28),
      const SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          Text(
            appLocalizations.welcome,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const Spacer(),
      // Animated theme toggle
      BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final isDark = themeMode == ThemeMode.dark;
          return IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode_outlined,
                key: ValueKey(isDark),
                color: Colors.white,
                size: 26,
              ),
            ),
          );
        },
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 26,
        ),
      ),
    ],
  );
}

Widget _buildSearchBar(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return Container(
    height: 48,
    decoration: BoxDecoration(
      color: isDark ? const Color(0xFF2C2C2C) : Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: TextField(
      style: TextStyle(color: isDark ? Colors.white : Colors.black),
      decoration: InputDecoration(
        hintText: "Search".tr,
        hintStyle: TextStyle(
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
        prefixIcon: Icon(
          Icons.search,
          color: isDark ? Colors.grey[400] : Colors.grey[600],
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  );
}

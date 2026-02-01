import 'package:flutter/material.dart';

/// =======================
/// BRAND / PRIMARY
/// =======================
// final Color appColor = Color.lerp(
//   const Color(0xFF1D9DF4), // light blue
//   const Color(0xFF292D30), // dark
//   0.5, // 0.0 = light, 1.0 = dark, 0.5 = middle
// )!;
const Color appColor = Color(0xFF236592);
const LinearGradient appGradient = LinearGradient(
  colors: [
    Color(0xFF1D9DF4), // light blue
    Color(0xff292D30), // darks
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// const Color appColor = Color(0xFF1DA1FA);
const Color appColor2 = Color(0xFF1D9DF4);
// ignore: use_full_hex_values_for_flutter_colors
const Color appColor3 = Color(0xFF292D30CC);
const Color buttonColor = Color(0xFF007BFF);
const Color unselected = Color(0xff9DB2CE);

/// =======================
/// TEXT COLORS
/// =======================
const Color primaryTextColor = Color(0xFF1A202C);
const Color secondaryTextColor = Color(0xFF4A5565);
const Color disabledTextColor = Color(0xFF9CA3AF);

/// =======================
/// LIGHT MODE BACKGROUNDS
/// =======================
const Color scaffoldColor = Color(0xFFF9FAFB);
const Color containerColor = Color(0xFFF9FAFB);
const Color fieldColor = Color(0xFFF5F6F7);
const Color inputFieldColor = Color(0xFFF5F6F7);
const Color divColor = Color(0xFFF5F5F5);
const Color radioColor = Color(0xFFE2E8F0);

/// =======================
/// DARK MODE BACKGROUNDS
/// =======================
const Color darkColor = Color(0xFF0B1020);
const Color darkColor2 = Color(0xFF0F172A);
const Color darkCardColor = Color(0xFF141B2D);
const Color darkFieldColor = Color(0xFF1E293B);

/// =======================
/// DARK MODE TEXT & UI
/// =======================
const Color darkBorder = Color(0xFF334155);
const Color darkText = Color(0xFFE2E8F0);
const Color darkTextSecondary = Color(0xFF94A3B8);
const Color darkDivider = Color(0xFF475569);
const Color darkBorderColor = Color(0xFF334155);

/// =======================
/// STATUS / FEEDBACK
/// =======================
const Color successColor = Color(0xFF22C55E);
const Color warningColor = Color(0xFFCB3843);
const Color infoColor = Color(0xFF38BDF8);

/// =======================
/// BORDERS & DIVIDERS
/// =======================
const Color borderColor = Color(0xFFE5E7EB);

/// =======================
/// BADGE & CHIP COLORS
/// =======================
const Color activeBadgeColor = Color(0xFF22C55E); // Green for active status
const Color inactiveBadgeColor = Color(0xFFCB3843); // Orange/Red for inactive
const Color deletedBadgeColor = Color(0xFFEF4444); // Red for deleted
// const Color roleBadgeColor = appColor; // Primary color for roles

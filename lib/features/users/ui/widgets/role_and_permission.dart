// import 'package:crm/Core/theming/colors.dart';
// import 'package:crm/features/auth/login/data/model/users_model.dart';
// import 'package:crm/features/language/localazation.dart';
// import 'package:crm/features/users/data/model/role_info.dart';
// import 'package:crm/features/users/data/model/users_model.dart';
// import 'package:flutter/material.dart';

// Widget buildRolePermissionsSection(
//   UsersModel user,
//   BuildContext context,
//   bool isDark,
//   AppLocalizations loc,
//   VoidCallback? onViewPermissions,
// ) {
//   int _getTotalPermissions() {
//     int count = 0;

//     // From roleInfo
//     if (user.permissions != null) {
//       count += user.permissions!.length;
//     }

//     // From direct permissions map
//     if (user.permissions != null) {
//       count += user.permissions!.length;
//     }

//     return count;
//   }

//   return Container(
//     padding: const EdgeInsets.all(16),
//     color: isDark ? Colors.white.withOpacity(0.02) : Colors.grey.shade50,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(
//               Icons.admin_panel_settings_outlined,
//               size: 18,
//               color: appColor.withOpacity(0.7),
//             ),
//             const SizedBox(width: 8),
//             Text(
//               loc.details,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//                 color: appColor,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),

//         // Role Info
//         if (user.roleInfo != null) ...[
//           _buildRoleInfoCard(user.roleInfo!, isDark, loc),
//         ] else if (user.role != null) ...[
//           Text(
//             "Role: ${user.role}",
//             style: TextStyle(
//               fontSize: 13,
//               color: isDark ? Colors.white : Colors.black87,
//             ),
//           ),
//         ],

//         const SizedBox(height: 12),

//         // Permissions Count & Action
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const Icon(
//                   Icons.key_rounded,
//                   size: 16,
//                   color: secondaryTextColor,
//                 ),
//                 const SizedBox(width: 6),
//                 Text(
//                   "${_getTotalPermissions()} Permissions",
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: secondaryTextColor,
//                   ),
//                 ),
//               ],
//             ),
//             if (onViewPermissions != null)
//               TextButton.icon(
//                 onPressed: onViewPermissions,
//                 icon: const Icon(Icons.visibility_outlined, size: 16),
//                 label: const Text("View All"),
//                 style: TextButton.styleFrom(
//                   foregroundColor: appColor,
//                   textStyle: const TextStyle(fontSize: 12),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildRoleInfoCard(
//   RoleInfo roleInfo,
//   bool isDark,
//   AppLocalizations loc,
// ) {
//   return Container(
//     padding: const EdgeInsets.all(12),
//     decoration: BoxDecoration(
//       color: appColor.withOpacity(0.05),
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(color: appColor.withOpacity(0.2)),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 roleInfo.roleName ?? "—",
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: appColor,
//                 ),
//               ),
//             ),
//             if (roleInfo.isSystemRole == true)
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: const Text(
//                   "System",
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.blue,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//         if (roleInfo.roleNameEn != null &&
//             roleInfo.roleNameEn != roleInfo.roleName) ...[
//           const SizedBox(height: 4),
//           Text(
//             roleInfo.roleNameEn!,
//             style: const TextStyle(fontSize: 12, color: secondaryTextColor),
//           ),
//         ],
//         if (roleInfo.description != null) ...[
//           const SizedBox(height: 6),
//           Text(
//             roleInfo.description!,
//             style: TextStyle(
//               fontSize: 11,
//               color: secondaryTextColor.withOpacity(0.8),
//             ),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ],
//     ),
//   );
// }

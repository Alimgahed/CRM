import 'package:flutter/material.dart';

/// A reusable PopupMenuButton widget that supports any number of items
class GlobalPopupMenu extends StatelessWidget {
  /// List of menu items
  final List<PopupMenuItemModel> items;

  /// Icon of the button (default is more_vert)
  final Icon? icon;

  const GlobalPopupMenu({
    super.key,
    required this.items,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: icon ?? const Icon(Icons.more_vert_rounded),
      onSelected: (index) {
        if (index >= 0 && index < items.length) {
          items[index].onTap?.call();
        }
      },
      itemBuilder: (context) => List.generate(
        items.length,
        (index) => PopupMenuItem(
          value: index,
          child: Row(
            children: [
              if (items[index].icon != null) ...[
                Icon(items[index].icon, color: items[index].iconColor),
                const SizedBox(width: 8),
              ],
              Text(items[index].title),
            ],
          ),
        ),
      ),
    );
  }
}

/// Model class for a single popup menu item
class PopupMenuItemModel {
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  PopupMenuItemModel({
    required this.title,
    this.icon,
    this.iconColor,
    this.onTap,
  });
}

import 'package:crm/Core/helpers/extesions.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/theming/styles.dart';
import 'package:crm/logic/Features/ImageController.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/// CustomTable now supports Widgets in cells and fixed styles.
class CustomTable extends StatelessWidget {
  /// Column headers (e.g., ['Name', 'Email', 'Phone'])
  final List<String> headers;

  /// Row data: each row = list of Widgets matching header count
  final List<List<Widget>> rows;

  /// Optional fixed height (default 300)
  final double height;

  /// Optional background color for rows
  final Color? rowEvenColor;
  final Color? rowOddColor;

  const CustomTable({
    super.key,
    required this.headers,
    required this.rows,
    this.height = 300,
    this.rowEvenColor,
    this.rowOddColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Divider(height: 1, color: Colors.grey.shade300),
          _buildBody(),
        ],
      ),
    );
  }

  /// ===== HEADER =====
  Widget _buildHeader() {
    return IntrinsicHeight(
      child: Row(
        children: [
          for (int i = 0; i < headers.length; i++) ...[
            _buildCell(
              ShaderMask(
                shaderCallback: (bounds) => appGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  headers[i],
                  style: TextStyles.size12(fontWeight: FontWeight.bold),
                ),
              ),
              isHeader: true,
            ),
            if (i != headers.length - 1) _verticalDivider(),
          ],
        ],
      ),
    );
  }

  /// ===== BODY =====
  Widget _buildBody() {
    if (rows.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            'لا توجد بيانات',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: rows.length,
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: Colors.grey.shade300),
      itemBuilder: (context, rowIndex) {
        final row = rows[rowIndex];

        return Container(
          color: Colors.white,
          height: 80,
          child: IntrinsicHeight(
            child: Row(
              children: [
                for (int i = 0; i < row.length; i++) ...[
                  _buildCell(row[i]),
                  if (i != row.length - 1) _verticalDivider(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  /// ===== CELL BUILDER =====
  Widget _buildCell(Widget child, {bool isHeader = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Center(child: child),
      ),
    );
  }

  /// ===== VERTICAL DIVIDER =====
  Widget _verticalDivider() =>
      VerticalDivider(color: Colors.grey.shade300, width: 1, thickness: 1);
}

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final double height;
  final Color? backgroundColor;
  final Color? iconColor;
  final double borderRadius;
  final ValueChanged<String>? onChanged;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.hintText = "Search...",
    this.prefixIcon = Icons.search,
    this.suffixIcon,
    this.onSuffixTap,
    this.height = 48,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius = 8,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Use provided colors or default based on theme
    final bg = backgroundColor ?? (isDark ? darkColor : Colors.white);
    final icColor = iconColor ?? (isDark ? Colors.white : Colors.grey);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(borderRadius),
        // Optional: Add border for better definition in dark mode
        border: isDark ? Border.all(color: darkBorder, width: 1) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(prefixIcon, color: icColor, size: 20),
          const SizedBox(width: 8),

          /// Text Field
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,

              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white : darkColor,
              ),
              decoration: InputDecoration(
                fillColor: backgroundColor,
                hintText: hintText.tr,
                hintStyle: TextStyle(color: icColor, fontSize: 12),
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),

          /// Optional Suffix Icon
          if (suffixIcon != null)
            IconButton(
              icon: Icon(suffixIcon, size: 20),
              color: icColor,
              onPressed: onSuffixTap,
            ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class MediaGridItem extends StatelessWidget {
  final String url;
  final bool isVideo;
  final VoidCallback onTap;

  const MediaGridItem({
    super.key,
    required this.url,
    required this.isVideo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              isVideo
                  ? "https://img.icons8.com/ios-filled/200/play-button-circled.png"
                  : url,
              fit: BoxFit.cover,
              // Performance optimizations
              cacheWidth: 200,
              cacheHeight: 200,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                      strokeWidth: 2,
                    ),
                  ),
                );
              },
            ),
          ),
          if (isVideo)
            const Positioned(
              right: 6,
              bottom: 6,
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 22,
              ),
            ),
        ],
      ),
    );
  }
}

class FullscreenImageViewer extends StatelessWidget {
  FullscreenImageViewer({
    super.key,
    required List<String> images,
    int initialIndex = 0,
  }) {
    controller.initImages(images, initialIndex);
  }

  final ImageController controller = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(
      initialPage: controller.currentIndex.value,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        title: Obx(
          () => Text(
            'Image ${controller.currentIndex.value + 1} of ${controller.images.length}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: controller.images.length,
        onPageChanged: controller.changeIndex,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Center(
              child: Image.network(
                controller.images[index],
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.white54,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// Assuming AppLocalizations is already defined for your app

class ReusableHeader extends StatelessWidget {
  final String? title; // If provided → show title + back arrow
  final Widget? child; // If provided → show custom widget
  final VoidCallback? onBack; // Callback for custom back navigation
  final double height;

  const ReusableHeader({
    super.key,
    this.title,
    this.child,
    this.onBack,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    // Get the localization instance dynamically from the current locale
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Stack(
      children: [
        SvgPicture.asset(
          "images/Mask group.svg",
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
        ),

        // Foreground content
        SizedBox(height: height, child: _buildContent(context, lang)),
      ],
    );
  }

  Widget _buildContent(
    BuildContext context,
    AppLocalizations appLocalizations,
  ) {
    // CASE 1 → Title mode (title + back arrow)
    if (child == null && title != null) {
      return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              IconButton(
                onPressed: onBack ?? () => context.pop(),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // CASE 2 → Custom widget mode (NO back arrow)
    return child ?? const SizedBox.shrink();
  }
}

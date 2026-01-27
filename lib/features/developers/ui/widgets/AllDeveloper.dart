import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm/Core/helpers/spacing.dart';
import 'package:crm/Core/theming/colors.dart';
import 'package:crm/Core/widgets/gloable.dart';
import 'package:crm/Core/widgets/buttons.dart';
import 'package:crm/features/developers/data/models/developers_model.dart';
import 'package:crm/features/developers/logic/cubit/developer_cubit.dart';
import 'package:crm/features/developers/logic/cubit/developer_states.dart';
import 'package:crm/features/language/cubit.dart';
import 'package:crm/features/language/localazation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

/// ============================================================================
/// ALL DEVELOPERS SCREEN
/// ============================================================================
class AllDevelopers extends StatelessWidget {
  const AllDevelopers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReusableHeader(title: 'Developers'.tr),
          heightSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SearchBarWidget(
              prefixIcon: Icons.search,
              suffixIcon: Icons.filter_list,
            ),
          ),
          heightSpace(10),
          Expanded(
            child: BlocBuilder<DeveloperCubit, DeveloperStates>(
              builder: (context, state) {
                return state.when(
                  initial: () => _buildEmptyState(context),
                  loading: () => _buildLoadingState(),
                  loaded: (developers) => _buildLoadedState(developers),
                  error: (message) => _buildErrorState(context, message),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.business_outlined,
            size: 80.sp,
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
          ),
          heightSpace(16),
          Text(
            'No Developers Found',
            style: TextStyle(
              fontSize: 18.sp,
              color: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      itemCount: 5,
      itemBuilder: (_, __) => const _DeveloperShimmerCard(),
    );
  }

  Widget _buildLoadedState(List<DeveloperCompany> developers) {
    if (developers.isEmpty) {
      return Builder(builder: (context) => _buildEmptyState(context));
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      itemCount: developers.length,
      itemBuilder: (_, index) => _DeveloperCard(developer: developers[index]),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 80.sp, color: Colors.red.shade400),
            heightSpace(16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
              ),
            ),
            heightSpace(24),
            CustomButton(
              text: 'Retry',
              onPressed: () {
                context.read<DeveloperCubit>().fetchAllDevelopmentCompanies();
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ============================================================================
/// DEVELOPER CARD WIDGET
/// ============================================================================
class _DeveloperCard extends StatelessWidget {
  final DeveloperCompany developer;

  const _DeveloperCard({required this.developer});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = context.select<LocaleCubit, AppLocalizations>(
      (cubit) => AppLocalizations(cubit.currentLocale),
    );

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? darkColor.withOpacity(0.3)
                : Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, isDark, lang),
          _buildDivider(isDark),
          _buildBody(context, isDark, lang),
          if (developer.projects?.isNotEmpty ?? false) ...[
            _buildDivider(isDark),
            _buildProjectsSection(context, isDark, lang),
          ],
          _buildDivider(isDark),
          _buildFooter(context, isDark, lang),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isDark,
    AppLocalizations lang,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          _buildLogo(isDark),
          widthSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  developer.companyNameEn ?? developer.companyNameAr ?? 'N/A',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : secondaryTextColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (developer.companyNameAr != null &&
                    developer.companyNameEn != null) ...[
                  heightSpace(4),
                  Text(
                    developer.companyNameAr!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: isDark
                          ? Colors.grey.shade400
                          : Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          _buildStatusBadge(isDark),
        ],
      ),
    );
  }

  Widget _buildLogo(bool isDark) {
    return Container(
      width: 70.w,
      height: 70.w,
      decoration: BoxDecoration(
        color: isDark ? darkColor : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark ? darkColor2 : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: developer.logoUrl != null
            ? CachedNetworkImage(
                imageUrl: developer.logoUrl!,
                fit: BoxFit.cover,
                placeholder: (_, __) => _buildLogoPlaceholder(isDark),
                errorWidget: (_, __, ___) => _buildLogoPlaceholder(isDark),
              )
            : _buildLogoPlaceholder(isDark),
      ),
    );
  }

  Widget _buildLogoPlaceholder(bool isDark) {
    return Icon(
      Icons.business,
      size: 32.sp,
      color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
    );
  }

  Widget _buildStatusBadge(bool isDark) {
    final isActive = developer.isActive ?? false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.green.withOpacity(0.1)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isActive ? Colors.green : Colors.grey,
          width: 1,
        ),
      ),
      child: Text(
        isActive ? 'Active' : 'Inactive',
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.green : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isDark, AppLocalizations lang) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (developer.contactPerson != null)
            _buildInfoRow(
              Icons.person_outline,
              lang.contactPerson,
              developer.contactPerson!,
              isDark,
            ),
          if (developer.contactNumber != null) ...[
            heightSpace(10),
            _buildInfoRow(
              Icons.phone_outlined,
              lang.contactNumber,
              developer.contactNumber!,
              isDark,
            ),
          ],
          if (developer.projectCount != null) ...[
            heightSpace(10),
            _buildInfoRow(
              Icons.apartment_outlined,
              lang.projects,
              '${developer.projectCount} ${lang.projects}',
              isDark,
              valueColor: appColor,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value,
    bool isDark, {
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20.sp,
          color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
        ),
        widthSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
                ),
              ),
              heightSpace(2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color:
                      valueColor ??
                      (isDark ? Colors.white : secondaryTextColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsSection(
    BuildContext context,
    bool isDark,
    AppLocalizations lang,
  ) {
    final projects = developer.projects ?? [];
    final displayCount = projects.length > 3 ? 3 : projects.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${lang.projects} (${projects.length})',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : secondaryTextColor,
            ),
          ),
          heightSpace(12),
          ...List.generate(
            displayCount,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: _buildProjectItem(projects[index], isDark),
            ),
          ),
          if (projects.length > 3) ...[
            heightSpace(8),
            Center(
              child: TextButton(
                onPressed: () {
                  // Navigate to full projects list
                },
                child: Text(
                  'View All ${projects.length} Projects',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: appColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProjectItem(dynamic project, bool isDark) {
    final projectName = project.projectName ?? project.projectNameEn ?? 'N/A';
    final location = project.location ?? '';

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isDark ? darkColor.withOpacity(0.3) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isDark ? darkColor2 : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.business_outlined, size: 20.sp, color: appColor),
          widthSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : secondaryTextColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (location.isNotEmpty) ...[
                  heightSpace(4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14.sp,
                        color: isDark
                            ? Colors.grey.shade500
                            : Colors.grey.shade500,
                      ),
                      widthSpace(4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(
    BuildContext context,
    bool isDark,
    AppLocalizations lang,
  ) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: lang.edit,
              height: 44.h,
              onPressed: () {
                // Handle edit
              },
            ),
          ),
          widthSpace(12),
          ActionButton(
            icon: Icons.delete_outline,
            onTap: () {
              // Handle delete
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Divider(
      height: 1,
      thickness: 1,
      color: isDark ? darkColor2 : Colors.grey.shade200,
    );
  }
}

/// ============================================================================
/// SHIMMER LOADING CARD
/// ============================================================================
class _DeveloperShimmerCard extends StatelessWidget {
  const _DeveloperShimmerCard();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark ? darkFieldColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? darkColor.withOpacity(0.3)
                : Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: isDark ? darkColor : Colors.grey.shade300,
        highlightColor: isDark ? darkColor2 : Colors.grey.shade100,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 70.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  widthSpace(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 18.h,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        heightSpace(8),
                        Container(
                          height: 14.h,
                          width: 150.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              heightSpace(16),
              Container(
                height: 14.h,
                width: double.infinity,
                color: Colors.white,
              ),
              heightSpace(8),
              Container(height: 14.h, width: 200.w, color: Colors.white),
              heightSpace(16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                  widthSpace(12),
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

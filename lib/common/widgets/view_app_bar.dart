import 'package:template/common/assets_path/icons_paths.dart';
import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/core/providers/localization_provider.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;

  const ViewAppBar({super.key, required this.title, this.titleColor, this.backgroundColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: AppBar(
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(title, style: AppFontStyle.medium20.copyWith(
            color: titleColor ?? AppColors.salte700
          ),),
        ),
        leadingWidth: 69.w,
        scrolledUnderElevation: 0.0,
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          margin: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 12.w,
          ),
          child: InkWell(
            onTap: () => context.pop(),
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              alignment: Alignment.center,
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.salte200,
              ),
              child: Transform(
                transform: Matrix4.identity()..scale(ref.watch(localizationProvider).currentLanguageIsEnglish ? -1.0 : 1.0, 1.0),
                alignment: Alignment.center,
                child: CustomIcon(
                  iconPath: IconsPaths.arrowBack,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(76.h);
}
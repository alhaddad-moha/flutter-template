import 'package:template/common/assets_path/icons_paths.dart';
import 'package:template/common/widgets/widgets.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  const CustomDropdownButtonFormField({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.label,
    this.onChanged,
    this.enabled = true,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
  });

  final List<DropdownMenuItem<T>>? items;
  final T? selectedItem;
  final Function(T?)? onChanged;
  final String label;
  final bool enabled;
  final Color? fillColor;

  final String? prefixIcon;
  final String? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(

      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          enabled: enabled,
          hintText: label,
          prefixIcon: prefixIcon == null
              ? null
              : Align(
                  alignment: Alignment.center,
                  widthFactor: 1.0,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 24.w,
                      end: 16.w,
                    ),
                    child: CustomIcon(
                      iconPath: prefixIcon!,
                      width: 24.r,
                      height: 24.r,
                      color: AppColors.salte400,
                    ),
                  ),
                ),
          // icon: Visibility(visible: false, child: Icon(Icons.arrow_downward)),

          suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 24.w,
                    end: 16.w,
                  ),
                  child: CustomIcon(
                    iconPath: suffixIcon ?? IconsPaths.arrowDown,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
          fillColor:
              enabled ? (fillColor ?? AppColors.salte200) : AppColors.salte300,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 18.h,
          ),
          hintStyle: AppFontStyle.medium16.copyWith(
            color: AppColors.salte800,
          ),
        ),
        icon: const SizedBox.shrink(),
        value: selectedItem,
        onChanged: enabled ? onChanged : null,
        items: items,
      ),
    );
  }
}

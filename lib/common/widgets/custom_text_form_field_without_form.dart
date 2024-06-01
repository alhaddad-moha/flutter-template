import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWithoutForm extends StatelessWidget {
  const CustomTextFormFieldWithoutForm({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.maxLength,
    this.fillColor,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.maxLines = 1,
    this.enabled = true,
    this.contentPadding,
  });

  final String label;
  final String? prefixIcon;
  final String? suffixIcon;
  final TextEditingController? controller;
  final int? maxLength;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool enabled;
  final double maxLines;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: prefixIcon == null
            ? null
            : Align(
                alignment: maxLines > 1
                    ? AlignmentDirectional.topStart
                    : Alignment.center,
                widthFactor: 1.0,
                heightFactor: maxLines,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 24.w,
                    end: 16.w,
                  ),
                  child: CustomIcon(
                    iconPath: prefixIcon!,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : InkWell(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 24.w,
                    end: 16.w,
                  ),
                  child: CustomIcon(
                    iconPath: suffixIcon!,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
              ),
        fillColor: enabled ? (fillColor ?? AppColors.salte200) : AppColors.salte300,
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
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 14.h,
        ),
        hintStyle: AppFontStyle.regular20.copyWith(
          color: AppColors.salte800,
        ),
      ),
      maxLength: maxLength,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

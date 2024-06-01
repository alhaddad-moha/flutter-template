import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.formControlName,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.validationMessages,
    this.maxLength,
    this.fillColor,
    this.obscureText = false,
    this.onTap,
    this.onChanged,
    this.hintStyle,
    this.textInputAction,
    this.onSubmitted,
    this.maxLines = 1,
    this.enabled = true,
  });

  final String formControlName;
  final String label;
  final String? prefixIcon;
  final String? suffixIcon;
  final Map<String, String Function(Object)>? validationMessages;
  final int? maxLength;
  final double maxLines;
  final Color? fillColor;
  final bool obscureText;
  final Function()? onTap;
  final TextStyle? hintStyle;
  final bool enabled;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(FormControl<String?>)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      key: Key(formControlName),
      formControlName: formControlName,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabled: enabled,
        hintText: label,
        prefixIcon: prefixIcon == null
            ? null
            : Align(
                alignment: maxLines > 1 ? AlignmentDirectional.topStart : Alignment.center,
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
                    color: AppColors.salte400,
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
                    width: 18.r,
                    height: 18.r,
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
        contentPadding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 14.h,
        ),
        hintStyle: hintStyle ?? AppFontStyle.regular20.copyWith(
          color: AppColors.salte800,
        ),
      ),
      onChanged: (FormControl <String?> value){
        if(onChanged != null){
          onChanged!(value.value!);
        }
      },
      maxLength: maxLength,
      maxLines: maxLines.toInt(),
      validationMessages: validationMessages,
      textInputAction: textInputAction ?? TextInputAction.next,
      onSubmitted: onSubmitted,
    );
  }
}

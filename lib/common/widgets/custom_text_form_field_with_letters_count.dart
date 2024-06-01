import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomTextFormFieldWithLettersCount extends StatefulWidget {
  const CustomTextFormFieldWithLettersCount({
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
    this.maxLines = 1,
    this.textInputAction,
    this.onSubmitted,
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
  final Function(String?)? onChanged;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;
  final void Function(FormControl<String?>)? onSubmitted;


  @override
  State<CustomTextFormFieldWithLettersCount> createState() =>
      _CustomTextFormFieldWithLettersCountState();
}

class _CustomTextFormFieldWithLettersCountState
    extends State<CustomTextFormFieldWithLettersCount> {
  ValueNotifier<int> textLength = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: widget.fillColor ?? AppColors.salte200,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.prefixIcon != null)
            Padding(
              padding: EdgeInsetsDirectional.only(top: 24.h, start: 27.w),
              child: CustomIcon(iconPath: widget.prefixIcon!),
            ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                8.verticalSpace,
                ReactiveTextField<String>(
                  key: Key(widget.formControlName),
                  formControlName: widget.formControlName,
                  obscureText: widget.obscureText,
                  decoration: InputDecoration(
                    hintText: widget.label,
                    contentPadding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 20.h,
                    ),
                    fillColor: widget.fillColor ?? AppColors.salte200,
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
                    hintStyle: widget.hintStyle ?? AppFontStyle.regular20.copyWith(
                      color: AppColors.salte800,
                    ),
                  ),
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines.toInt(),
                  validationMessages: widget.validationMessages,
                  textInputAction: widget.textInputAction ?? TextInputAction.next,
                  onSubmitted: widget.onSubmitted,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(256),
                  ],
                  onChanged: (text) {
                    widget.onChanged?.call(
                      text.value,
                    );
                    setState(() {
                      textLength.value = text.value!.length;
                    });
                  },
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 24.w,
                      bottom: 20.h
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: textLength,
                      builder: (context, value, child) {
                        return Container(
                          color: widget.fillColor ?? AppColors.salte200,
                          child: Text(
                            "${value.toString()}/256",
                            textDirection: TextDirection.ltr,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/common/widgets/loading.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:template/core/utils/extensions/extensions.dart';

import 'disable_widget.dart';

enum ButtonType { gradiant, sold }

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? child;
  final String? prefixIcon;
  final bool center;
  final bool disabled;
  final bool isBusy;
  final Color? buttonColor;
  final Color? labelColor;
  final double? height;
  final double? width;
  final double? radius;
  final double? labelSize;
  final String label;
  final ButtonType buttonType;

  const CustomButton({
    required this.onTap,
    this.child,
     this.height,
    this.width,
    this.center = true,
    this.buttonColor,
    this.buttonType = ButtonType.gradiant,
    Key? key,
    this.disabled = false,
    this.isBusy = false,
    this.radius,
    this.label = "",
    this.prefixIcon,
    this.labelColor,
    this.labelSize,
  }) : super(key: key);

  BoxDecoration get boxDecoration {
    if (buttonType == ButtonType.gradiant) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 24.r),
        gradient: AppColors.buttonGradiant
      );
    }

    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 24.r),
      color: buttonColor ?? AppColors.buttonSoldColor,
    );
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      height: height ?? 70.h,
      width: 1.sw,
      decoration: boxDecoration,
      child: DisableWidget(
        condition: disabled,
        child: ElevatedButton(
          onPressed: disabled ? null : onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          ),
          child: child ?? Center(
            child: Builder(
              builder: (context) {

                if(isBusy){
                  return Loading(
                    size: 25.r,
                    color: Colors.white,
                  );
                }
                return FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if(prefixIcon != null)
                        ...[
                          CustomIcon(iconPath: prefixIcon!),
                          8.w.widthSizedBox,
                        ],
                      Text(
                        label,
                        style: AppFontStyle.bold16.copyWith(
                          color: buttonType == ButtonType.gradiant ? Colors.white : labelColor ?? AppColors.salte800,
                          fontSize: labelSize
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.height,
      this.title,
      required this.icon,
      required this.fillColor,
      required this.child, this.titleColor});

  final double height;
  final String? title;
  final String icon;
  final Color fillColor;
  final Color? titleColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height,
              padding: EdgeInsets.only(
                  left: 12.w, right: 12.w, bottom: 12.w, top: 37.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(title != null)
                  Text(title??"", style: AppFontStyle.bold24.copyWith(
                    color: titleColor
                  ),),
                  Container(
                    width: 1.sw,
                    child: child,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20.h,
              left: 1.sw / 2 - 35.w,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40.w,
                  width: 40.w,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 4.r,
                      ),
                    ),
                    color: fillColor,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    height: 22.w,
                    width: 22.w,
                    child: CustomIcon(
                      iconPath: icon,
                      height: 22.w,
                      width: 22.w,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static void show({required BuildContext context, required double height,   String? title,
  required String icon,
  required Color fillColor,
  required Widget child, Color? titleColor}) {
    showDialog(
        context: context,
        builder: (_) {
          return CustomDialog(
            height: height,
            title: title,
            icon: icon,
            fillColor: fillColor,
            titleColor: titleColor,
            child: child,
          );
        });
  }
}

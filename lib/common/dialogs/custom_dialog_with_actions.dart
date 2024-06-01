import 'package:template/common/widgets/widgets.dart';
import 'package:template/core/providers/localization_provider.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomDialogWithActions extends StatelessWidget {
  const CustomDialogWithActions({
    super.key,
    required this.height,
    this.title,
    required this.icon,
    required this.fillColor,
    required this.child,
    this.titleColor,
    this.stream,
    this.onButtonPressed,
    required this.disable,
    this.buttonType,
  });

  final double height;
  final String? title;
  final String icon;
  final Color fillColor;
  final Color? titleColor;
  final Widget child;
  final Stream<dynamic>? stream;
  final Future<bool> Function()? onButtonPressed;
  final ButtonType? buttonType;

  final bool disable;

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
              padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w, top: 37.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title ?? "",
                      style: AppFontStyle.bold24.copyWith(color: titleColor),
                    ),
                  SizedBox(
                    width: 1.sw,
                    child: child,
                  ),
                  12.verticalSpace,
                  Row(children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          context.pop();
                        },
                        height: 60.h,
                        label: "cancel",
                        buttonType: ButtonType.sold,
                      ),
                    ),
                    23.horizontalSpace,
                    Expanded(
                      child: StreamBuilder(
                        stream: stream,
                        builder: (context, snapshot) {
                          return HookConsumer(
                            builder: (context, value, child) {
                              var isLoading = useState(false);

                              return CustomButton(
                                onTap: () async {
                                  isLoading.value = true;
                                  final result = await onButtonPressed?.call() ?? false;
                                  isLoading.value = false;

                                  if (result) {
                                    context.pop(true);
                                  }
                                },
                                height: 60.h,
                                label: "reject_order",
                                buttonType: buttonType ?? ButtonType.sold,
                                labelColor: Colors.white,
                                buttonColor: AppColors.danger500,
                                isBusy: isLoading.value,
                                disabled: isLoading.value,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ]),
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

  static void show(
      {required BuildContext context,
      required double height,
      String? title,
      required String icon,
      required Color fillColor,
      required Widget child,
      Color? titleColor,
      Stream<dynamic>? stream,
      Future<bool> Function()? onButtonPressed,
      bool disable = false,
      ButtonType? buttonType}) {
    showDialog(
        context: context,
        builder: (_) {
          return CustomDialogWithActions(
            height: height,
            title: title,
            icon: icon,
            fillColor: fillColor,
            titleColor: titleColor,
            disable: disable,
            onButtonPressed: onButtonPressed,
            stream: stream,
            buttonType: buttonType,
            child: child,
          );
        });
  }
}

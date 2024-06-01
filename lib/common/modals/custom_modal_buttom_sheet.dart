import 'package:template/common/assets_path/icons_paths.dart';
import 'package:template/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 9.h,
            width: 28.w,
            child: const CustomIcon(
              iconPath: IconsPaths.bottomSheetTop1,
            ),
          ),
        ),
        SizedBox(
          width: 1.sw,
          child: CustomIcon(
            iconPath: IconsPaths.bottomSheetTop2,
            width: 1.sw,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 36.h,
            top: 16.h,
          ),
          child: child,
        )
      ],
    );
  }

  static Future show(
      {required BuildContext context, required Widget child}) async {
    await showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: 368.h,
        minHeight: 368.h,
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CustomModalBottomSheet(child: child);
      },
    );
  }
}

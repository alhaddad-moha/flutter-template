import 'package:template/common/assets_path/icons_paths.dart';
import 'package:template/common/widgets/widgets.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:template/core/utils/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.descriptions, this.descriptionsFontSize});

  final String title;
  final String descriptions;
  final double? descriptionsFontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomIcon(
          iconPath: IconsPaths.companyVerticalIdentity,
          width: 183.w,
          height: 116.h,
        ),
        36.h.heightSizedBox,
        Text(
          title,
          style: AppFontStyle.bold12.copyWith(
            color: AppColors.blue500,
            fontSize: 32.sp,
          ),
        ),
        Text(
          descriptions,
          style: AppFontStyle.regular20.copyWith(
            color: AppColors.salte700,
            fontSize: descriptionsFontSize
          ),
          textAlign: TextAlign.center,
        ),
        32.h.heightSizedBox,
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.iconPath, this.height, this.width, this.color, this.fit = BoxFit.contain});

  final String iconPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      fit: fit,
      height: height ?? 20.r,
      width: width ?? 20.r,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

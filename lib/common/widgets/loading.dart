import 'package:template/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size, this.color});

  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 30.r,
      width: size ?? 30.r,
      child: CircularProgressIndicator(
        color: color ??  Colors.white,
      ),
    );
  }
}

import 'package:template/common/assets_path/icons_paths.dart';
import 'package:template/common/widgets/custom_icon.dart';
import 'package:template/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 9.h,
                width: 28.w,
                child: const CustomIcon(
                  iconPath: IconsPaths.bottomSheetTop1,
                ),
              ),
            ).toSliverToBoxAdapter,
            SizedBox(
              width: 1.sw,
              child: CustomIcon(
                iconPath: IconsPaths.bottomSheetTop2,
                width: 1.sw,
                fit: BoxFit.fill,
              ),
            ).toSliverToBoxAdapter,
            SliverList(
              delegate: SliverChildListDelegate(
                [...children],
              ),
            ),
            SliverFillRemaining(
              child: Container(
                color: Colors.white,
              ),
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class MyCustomScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details){
    return child;
  }
}


class RemoveGlowWrapper extends StatelessWidget {
  const RemoveGlowWrapper({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(behavior: MyCustomScrollBehaviour(), child: child);
  }
}


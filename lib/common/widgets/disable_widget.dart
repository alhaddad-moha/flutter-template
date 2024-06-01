import 'package:flutter/material.dart';

class DisableWidget extends StatelessWidget {

  const DisableWidget({
    Key? key,
    required this.child,
    this.condition = true,
    this.withOpacity = true,
    this.opacity = 0.6,
    this.opacityDuration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final Widget child;
  final bool condition;
  final bool withOpacity;
  final double opacity;
  final Duration opacityDuration;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: condition,
      child: withOpacity
          ? AnimatedOpacity(
              duration: opacityDuration,
              opacity: !condition ? 1 : opacity,
              child: child,
            )
          : child,
    );
  }
}

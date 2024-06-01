import 'package:flutter/material.dart';

class AnimatedVisibility extends StatefulWidget {
  final bool visible;
  final Widget child;
  final Curve curve;
  final Duration duration;
  final bool alwaysIncludeSemantics;

  const AnimatedVisibility({
    Key? key,
    this.visible = true,
    required this.child,
    this.curve = Curves.linear,
    required this.duration,
    this.alwaysIncludeSemantics = false,
  }) : super(key: key);

  @override
  _AnimatedVisibilityState createState() => _AnimatedVisibilityState();
}

class _AnimatedVisibilityState extends State<AnimatedVisibility> {
  bool _isNotBuild = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.visible ? 1 : 0,
      duration: widget.duration,
      curve: widget.curve,
      alwaysIncludeSemantics: widget.alwaysIncludeSemantics,
      onEnd: () {
        if (!_isNotBuild) return;

        setState(() {
          _isNotBuild = false;
        });
      },
      child: Visibility(
        visible: widget.visible,
        child: widget.child,
      ),
    );
  }
}

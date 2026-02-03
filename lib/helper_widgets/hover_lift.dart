import 'package:flutter/material.dart';
import 'package:final_site/theme/app_theme.dart';

class HoverLift extends StatefulWidget {
  final Widget child;
  final double lift;
  final double scale;

  const HoverLift({
    super.key,
    required this.child,
    this.lift = 4,
    this.scale = 1.02,
  });

  @override
  State<HoverLift> createState() => _HoverLiftState();
}

class _HoverLiftState extends State<HoverLift> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    if (reduceMotion) {
      return widget.child;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppMotion.fast,
        curve: AppMotion.emphasized,
        transformAlignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(0.0, _hovered ? -widget.lift : 0.0)
          ..scale(_hovered ? widget.scale : 1.0),
        child: widget.child,
      ),
    );
  }
}

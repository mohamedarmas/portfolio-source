import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:final_site/theme/app_theme.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset offset;

  const AnimatedSection({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.offset = const Offset(0, 40),
  });

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _isVisible = false;
  bool _reduceMotion = false;

  @override
  Widget build(BuildContext context) {
    _reduceMotion = MediaQuery.of(context).disableAnimations;
    return VisibilityDetector(
      // ✅ UNIQUE KEY — this fixes your issue
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if ((_reduceMotion || info.visibleFraction > 0.15) && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: AnimatedOpacity(
        opacity: _isVisible ? 1 : 0,
        duration: _reduceMotion ? Duration.zero : widget.duration,
        curve: AppMotion.gentle,
        child: AnimatedSlide(
          offset: _isVisible
              ? Offset.zero
              : Offset(
                  widget.offset.dx / 100,
                  widget.offset.dy / 100,
                ),
          duration: _reduceMotion ? Duration.zero : widget.duration,
          curve: AppMotion.emphasized,
          child: widget.child,
        ),
      ),
    );
  }
}

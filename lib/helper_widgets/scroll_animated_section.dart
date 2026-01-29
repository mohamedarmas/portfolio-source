import 'package:flutter/material.dart';

class ScrollAnimatedSection extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final double triggerOffset;
  final Offset slideOffset;
  final bool animateOnLoad;

  const ScrollAnimatedSection({
    super.key,
    required this.child,
    required this.controller,
    required this.triggerOffset,
    this.slideOffset = const Offset(0, 40),
    this.animateOnLoad = false, // 👈 NEW
  });

  @override
  State<ScrollAnimatedSection> createState() =>
      _ScrollAnimatedSectionState();
}

class _ScrollAnimatedSectionState extends State<ScrollAnimatedSection> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    /// ✅ Animate immediately after first frame if requested
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.animateOnLoad) {
        setState(() => _visible = true);
      } else if (widget.controller.offset >= widget.triggerOffset) {
        setState(() => _visible = true);
      }
    });

    widget.controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_visible || widget.animateOnLoad) return;

    if (widget.controller.offset >= widget.triggerOffset) {
      setState(() => _visible = true);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 700),
      opacity: _visible ? 1 : 0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        offset: _visible
            ? Offset.zero
            : Offset(
                widget.slideOffset.dx / 100,
                widget.slideOffset.dy / 100,
              ),
        child: widget.child,
      ),
    );
  }
}

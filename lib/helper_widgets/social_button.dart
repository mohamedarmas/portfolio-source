import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/hover_lift.dart';
import 'package:final_site/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatefulWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final reduceMotion =
        MediaQuery.of(context).accessibilityFeatures.disableAnimations;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: HoverLift(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: reduceMotion ? Duration.zero : AppMotion.fast,
              curve: AppMotion.emphasized,
              width: 260,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: _hovered ? AppColors.white : AppColors.surface,
                border: Border.all(
                  color: _hovered ? AppColors.ink : AppColors.border,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.black,
                    child: SvgPicture.asset(
                      widget.icon,
                      height: 18,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(widget.label, style: CustomTextStyle.buttonTextBlack()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

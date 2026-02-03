import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:final_site/theme/app_theme.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const NavItem(this.title, this.onTap, {super.key});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: reduceMotion ? Duration.zero : AppMotion.fast,
          curve: AppMotion.emphasized,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isHovering ? AppColors.white : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: Text(
            widget.title,
            style: CustomTextStyle.appBarTextWhite(
              color: isHovering ? AppColors.white : AppColors.subtle,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 12 : 16, // ✅ key change
            ),
          ),
        ),
      ),
    );
  }
}

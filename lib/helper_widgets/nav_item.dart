import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:flutter/material.dart';

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

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: CustomTextStyle.appBarTextWhite(
            color: isHovering ? Colors.blueGrey : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: isMobile ? 12 : 16, // ✅ key change
          ),
        ),
      ),
    );
  }
}

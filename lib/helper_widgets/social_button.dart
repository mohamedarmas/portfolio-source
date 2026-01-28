import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 260,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.15),
              Colors.white.withOpacity(0.05),
            ],
          ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.4),
          //     blurRadius: 12,
          //     offset: const Offset(0, 6),
          //   ),
          // ],
          border: Border.all(color: Colors.black.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(icon, height: 18, color: Colors.black),
            ),
            const SizedBox(width: 14),
            Text(label, style: CustomTextStyle.buttonTextBlack()),
          ],
        ),
      ),
    );
  }
}

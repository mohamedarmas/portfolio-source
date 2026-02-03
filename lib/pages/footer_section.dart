import 'package:flutter/material.dart';
import 'package:final_site/theme/app_theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: AppColors.surface,
      child: Center(
        child: Text(
          '© 2026 Mohamed Armas · Built with Flutter Web',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.ink,
                letterSpacing: 0.2,
              ),
        ),
      ),
    );
  }
}

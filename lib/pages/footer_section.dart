import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.grey.shade100,
      child: const Center(
        child: Text('© 2026 Mohamed Armas · Built with Flutter Web'),
      ),
    );
  }
}
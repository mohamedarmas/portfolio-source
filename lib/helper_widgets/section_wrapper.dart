import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final String? title;
  final Widget child;

  const SectionWrapper({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 0), // 👈 reduced
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // ✅ key fix
        children: [
          if (title != null && title!.isNotEmpty) ...[
            Text(
              title!,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center, // ✅
            ),
            const SizedBox(height: 40),
          ],
          child,
        ],
      ),
    );
  }
}

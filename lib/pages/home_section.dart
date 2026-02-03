import 'package:final_site/helper_widgets/hover_lift.dart';
import 'package:final_site/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final Function(GlobalKey) onNavigate;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;

  const HomeSection({
    super.key,
    required this.onNavigate,
    required this.projectsKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      color: AppColors.black,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? AppSpacing.sectionYCompact : AppSpacing.sectionY,
        horizontal: AppSpacing.contentX,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 800;

              return isMobile
                  ? _buildColumnLayout(context)
                  : _buildRowLayout(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRowLayout(BuildContext context) {
    const double imageSize = 350;

    return SizedBox(
      // Ensures the Stack is tall enough for the image
      height: imageSize + 40, // small breathing space
      child: Stack(
        clipBehavior: Clip.none, // 🔑 IMPORTANT
        children: [
          // Main content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTextContent(context)),
              const SizedBox(width: 40),
              const SizedBox(width: imageSize), // reserve image width
            ],
          ),

          // Bottom-aligned image
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/profile.png',
              width: imageSize,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageAlignedBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        'assets/images/profile.png',
        width: 260,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildColumnLayout(BuildContext context) {
    const double imageSize = 260;
    const double gap = 20; // precise gap between text and image

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top breathing space (controlled)
            _buildTextContent(context),

            // exact space needed for image + small gap
            const SizedBox(height: imageSize + gap),
          ],
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/images/profile.png',
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I’m Mohamed Armas',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Flutter Developer with 1+ year of experience building scalable, high-performance mobile and web applications. '
          'Strong focus on clean architecture, REST APIs, Firebase, and modern UI/UX.',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(
            color: AppColors.subtle,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            HoverLift(
              child: ElevatedButton(
                onPressed: () => onNavigate(projectsKey),
                child: const Text('View Projects'),
              ),
            ),
            const SizedBox(width: 16),
            HoverLift(
              child: OutlinedButton(
                onPressed: () => onNavigate(contactKey),
                child: const Text('Contact Me'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'assets/images/profile.png',
      width: 260,
      height: 260,
      fit: BoxFit.contain,
    );
  }
}

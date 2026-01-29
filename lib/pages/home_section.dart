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
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 48 : 0,
        horizontal: 24,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          // ✅ key fix
          child: _buildImage(),
        ),
        const SizedBox(height: 32),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
        Text(
          'Hi, I’m Mohamed Armas',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Flutter Developer with 1+ year of experience building scalable, high-performance mobile and web applications. '
          'Strong focus on clean architecture, REST APIs, Firebase, and modern UI/UX.',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.white70, height: 1.6),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => onNavigate(projectsKey),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
              ),
              child: const Text('View Projects'),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () => onNavigate(contactKey),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white54),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 16,
                ),
              ),
              child: const Text('Contact Me'),
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

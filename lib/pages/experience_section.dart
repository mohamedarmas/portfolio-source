import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Container(
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
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
      ),
    );
  }

  /// Desktop / Tablet
  Widget _buildRowLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// LEFT – Image
        Expanded(
          flex: 5,
          child: Center(
            child: Column(
              children: [
                Text(
                  'Experience',
                  style: CustomTextStyle.headlinewhite(color: Colors.white),
                ),
                const SizedBox(height: 24),
                Image.asset(
                  'assets/images/champ.png',
                  width: 360,
                  height: 360,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 60),

        /// RIGHT – Text
        Expanded(flex: 15, child: _buildTextContent()),
      ],
    );
  }

  /// Mobile
  Widget _buildColumnLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/champ.png',
          width: 280,
          height: 280,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 32),
        _buildTextContent(),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• Buckypaper Technologies | Aug 2024 - Nov 2025',
          style: CustomTextStyle.bodyTextWhite(color: Colors.white),
          maxLines: 1,
        ),
        const SizedBox(height: 6),
        Text(
          ' — Software Engineer',
          style: CustomTextStyle.bodyTextWhite(color: Colors.white),
        ),
        const SizedBox(height: 12),
        Text(
          '• Buckypaper Technologies | May 2024 - Aug 2025',
          style: CustomTextStyle.bodyTextWhite(color: Colors.white),
          maxLines: 1,
        ),
        const SizedBox(height: 6),
        Text(
          ' — Flutter Developer',
          style: CustomTextStyle.bodyTextWhite(color: Colors.white),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

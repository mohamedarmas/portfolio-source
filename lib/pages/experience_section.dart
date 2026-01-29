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
                    ? _buildColumnLayout(context, isMobile)
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
        /// LEFT – Image + title
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
        Expanded(flex: 15, child: _buildTextContent(false)),
      ],
    );
  }

  /// Mobile
  Widget _buildColumnLayout(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Experience',
          textAlign: TextAlign.center,
          style: CustomTextStyle.headlinewhite(color: Colors.white).copyWith(
            fontSize: 22, // ✅ reduced
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          'assets/images/champ.png',
          width: 240, // ✅ reduced
          height: 240,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 24),
        _buildTextContent(true),
      ],
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.start,
      children: [
        Text(
          '• Buckypaper Technologies | Aug 2024 - Nov 2025',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: CustomTextStyle.bodyTextWhite(color: Colors.white).copyWith(
            fontSize: isMobile ? 13 : 26, // ✅ reduced
          ),
          maxLines: isMobile ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          '— Software Engineer',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: CustomTextStyle.bodyTextWhite(color: Colors.white).copyWith(
            fontSize: isMobile ? 12 : 22, // ✅ reduced
          ),
        ),
        const SizedBox(height: 14),

        Text(
          '• Buckypaper Technologies | May 2024 - Aug 2025',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: CustomTextStyle.bodyTextWhite(color: Colors.white).copyWith(
            fontSize: isMobile ? 13 : 26, // ✅ reduced
          ),
          maxLines: isMobile ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          '— Flutter Developer',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: CustomTextStyle.bodyTextWhite(color: Colors.white).copyWith(
            fontSize: isMobile ? 12 : 22, // ✅ reduced
          ),
        ),
      ],
    );
  }
}

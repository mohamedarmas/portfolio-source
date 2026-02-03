import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/hover_lift.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:final_site/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Container(
        width: double.infinity,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width < 800
              ? AppSpacing.sectionYCompact
              : AppSpacing.sectionY,
          horizontal: AppSpacing.contentX,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 800;

            return isMobile
                ? _buildColumnLayout(context, isMobile)
                : _buildRowLayout(context);
          },
        ),
      ),
    );
  }

  /// Desktop
  Widget _buildRowLayout(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildTextContent(context, false)),
            const SizedBox(width: 48),
            Expanded(child: _buildImage(false)),
          ],
        ),
      ),
    );
  }

  /// Mobile
  Widget _buildColumnLayout(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImage(true),
        const SizedBox(height: 16),
        _buildTextContent(context, true),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        /// Heading
        Text(
          'Projects',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: CustomTextStyle.headlinewhite(color: AppColors.black).copyWith(
            fontSize: isMobile ? 22 : 32, // ✅ reduced on mobile
          ),
        ),
        const SizedBox(height: 10),

        /// Body
        Text(
          'Most of the projects I have developed are completely open-source on my GitHub.',
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: CustomTextStyle.bodyTextWhite(color: AppColors.ink).copyWith(
            fontSize: isMobile ? 13 : 16, // ✅ reduced on mobile
            height: 1.5,
          ),
        ),
        const SizedBox(height: 18),

        /// Button
        Align(
          alignment: isMobile ? Alignment.center : Alignment.centerLeft,
          child: HoverLift(
            child: ElevatedButton(
              onPressed: () {
                openLink('https://github.com/mohamedarmas?tab=repositories');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 28,
                  vertical: isMobile ? 12 : 16,
                ),
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
              ),
              child: Text(
                'See Projects',
                style: CustomTextStyle.buttonTextWhite().copyWith(
                  fontSize: isMobile ? 13 : 15, // ✅ reduced
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(bool isMobile) {
    return Center(
      child: Image.asset(
        'assets/images/mockup.png',
        width: isMobile ? 260 : 420,
        height: isMobile ? 260 : 420,
        fit: BoxFit.contain,
      ),
    );
  }

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

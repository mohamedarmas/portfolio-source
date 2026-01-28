import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return isMobile
              ? _buildColumnLayout(context)
              : _buildRowLayout(context);
        },
      ),
    );
  }

  Widget _buildRowLayout(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // ✅
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _buildTextContent(context)),
            const SizedBox(width: 48),
            Expanded(child: _buildImage()),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // ✅
      children: [
        _buildImage(),
        const SizedBox(height: 32),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // ✅
      children: [
        Text(
          'Projects',
          textAlign: TextAlign.start, // ✅
          style: CustomTextStyle.headlinewhite(color: Colors.black),
        ),
        Text(
          'Most of the projects I have developed are completely open-source on my GitHub.',
          textAlign: TextAlign.start, // ✅
          style: CustomTextStyle.bodyTextWhite(color: Colors.black),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            openLink('https://github.com/mohamedarmas?tab=repositories');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            elevation: 0,
            backgroundColor: Colors.black,
          ),
          child: Text('See Projects', style: CustomTextStyle.buttonTextWhite()),
        ),
      ],
    );
  }

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // works on web + mobile
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset(
        'assets/images/mockup.png',
        width: 420,
        height: 420,
        fit: BoxFit.contain,
      ),
    );
  }
}

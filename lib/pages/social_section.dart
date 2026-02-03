import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:final_site/helper_widgets/social_button.dart';
import 'package:final_site/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical:
                  isMobile ? AppSpacing.sectionYCompact : AppSpacing.sectionY,
              horizontal: AppSpacing.contentX,
            ),
            color: AppColors.white,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🖥 Desktop layout (unchanged structure)
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LEFT TEXT
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Social Links', style: CustomTextStyle.headlineblack()),
              const SizedBox(height: 20),
              Text(
                'Follow me on my social platforms:',
                style: CustomTextStyle.bodyTextBlack(),
              ),
            ],
          ),
        ),

        /// RIGHT BUTTON STACK
        Expanded(flex: 4, child: _buildButtons(centered: false)),
      ],
    );
  }

  /// 📱 Mobile layout
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Social Links',
          textAlign: TextAlign.center,
          style: CustomTextStyle.headlineblack().copyWith(
            fontSize: 22, // ✅ reduced
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Follow me on my social platforms:',
          textAlign: TextAlign.center,
          style: CustomTextStyle.bodyTextBlack().copyWith(
            fontSize: 13, // ✅ reduced
          ),
        ),
        const SizedBox(height: 28),
        _buildButtons(centered: true),
      ],
    );
  }

  /// Buttons (shared)
  Widget _buildButtons({required bool centered}) {
    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        SocialButton(
          icon: 'assets/images/github.svg',
          label: 'GitHub',
          onTap: () => openLink('https://github.com/mohamedarmas'),
        ),
        const SizedBox(height: 12),
        SocialButton(
          icon: 'assets/images/linkedin.svg',
          label: 'LinkedIn',
          onTap: () =>
              openLink('https://www.linkedin.com/in/mohamed-armas2810/'),
        ),
        const SizedBox(height: 12),
        SocialButton(
          icon: 'assets/images/stack-overflow.svg',
          label: 'Stack Overflow',
          onTap: () => openLink(
            'https://stackoverflow.com/users/26977285/mohamed-armas',
          ),
        ),
        const SizedBox(height: 12),
        SocialButton(
          icon: 'assets/images/discord.svg',
          label: 'Discord',
          onTap: () => openLink('https://discord.com/users/756883775262163005'),
        ),
        const SizedBox(height: 12),
        SocialButton(
          icon: 'assets/images/udemy.svg',
          label: 'Udemy',
          onTap: () => openLink('https://www.udemy.com/user/mohamed-armas-k/'),
        ),
        const SizedBox(height: 12),
        SocialButton(
          icon: 'assets/images/instagram.svg',
          label: 'Instagram',
          onTap: () => openLink('https://www.instagram.com/armaxislost/'),
        ),
      ],
    );
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}

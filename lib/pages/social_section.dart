import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:final_site/helper_widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSection extends StatelessWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Color(0xFF05040F), Color(0xFF0B0A2A), Color(0xFF05040F)],
          // ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// LEFT TEXT
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social Links',
                        style: CustomTextStyle.headlineblack(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Follow me on my social platforms:',
                        style: CustomTextStyle.bodyTextBlack(),
                      ),
                    ],
                  ),
                ),

                /// RIGHT BUTTON STACK
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      SocialButton(
                        icon: 'assets/images/github.svg',
                        label: 'GitHub',
                        onTap: () {
                          openLink('https://github.com/mohamedarmas');
                        },
                      ),
                      const SizedBox(height: 14),
                      SocialButton(
                        icon: 'assets/images/linkedin.svg',
                        label: 'LinkedIn',
                        onTap: () {
                          openLink(
                            'https://www.linkedin.com/in/mohamed-armas2810/',
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      SocialButton(
                        icon: 'assets/images/stack-overflow.svg',
                        label: 'Stack Overflow',
                        onTap: () {
                          openLink(
                            'https://stackoverflow.com/users/26977285/mohamed-armas',
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      SocialButton(
                        icon: 'assets/images/discord.svg',
                        label: 'Discord',
                        onTap: () {
                          openLink(
                            'https://discord.com/users/756883775262163005',
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      SocialButton(
                        icon: 'assets/images/udemy.svg',
                        label: 'Udemy',
                        onTap: () {
                          openLink(
                            'https://www.udemy.com/user/mohamed-armas-k/',
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      SocialButton(
                        icon: 'assets/images/instagram.svg',
                        label: 'Instagram',
                        onTap: () {
                          openLink('https://www.instagram.com/armaxislost/');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
}

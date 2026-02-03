import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:final_site/helper_widgets/toast.dart';
import 'package:final_site/services/contact_api.dart';
import 'package:final_site/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  bool _isLoading = false;
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return regex.hasMatch(email.trim());
  }

  Future<void> _send() async {
    if (_nameCtrl.text.isEmpty ||
        _emailCtrl.text.isEmpty ||
        _subjectCtrl.text.isEmpty ||
        _messageCtrl.text.isEmpty) {
      showErrorToast('Please fill all fields');
      return;
    }

    if (!_isValidEmail(_emailCtrl.text)) {
      showErrorToast('Enter a valid email address');
      return;
    }

    setState(() => _isLoading = true);

    try {
      final responseMessage = await ContactApi.sendMessage(
        name: _nameCtrl.text,
        email: _emailCtrl.text,
        subject: _subjectCtrl.text,
        message: _messageCtrl.text,
      );

      showSuccessToast(responseMessage);
      print('SUCCESS: $responseMessage');

      _nameCtrl.clear();
      _emailCtrl.clear();
      _subjectCtrl.clear();
      _messageCtrl.clear();
    } catch (e) {
      showErrorToast(e.toString().replaceAll('Exception:', '').trim());
      print('ERROR: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return SectionWrapper(
      child: Container(
        width: double.infinity,
        color: AppColors.black,
        padding: EdgeInsets.symmetric(
          vertical:
              isMobile ? AppSpacing.sectionYCompact : AppSpacing.sectionY,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),

            child: Container(
              margin: isMobile
                  ? const EdgeInsets.symmetric(horizontal: 16)
                  : EdgeInsets.zero,
              padding: EdgeInsets.all(isMobile ? 24 : 32), // ✅ reduced
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white.withOpacity(0.06),
                border: Border.all(color: AppColors.white.withOpacity(0.15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Title
                  Text(
                    'Contact Me',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.headlinewhite().copyWith(
                      fontSize: isMobile ? 22 : 32, // ✅ reduced
                    ),
                  ),
                  SizedBox(height: isMobile ? 24 : 32),

                  _field('Name', _nameCtrl, isMobile: isMobile),
                  const SizedBox(height: 14),
                  _field('Email', _emailCtrl, isMobile: isMobile),
                  const SizedBox(height: 14),
                  _field('Subject', _subjectCtrl, isMobile: isMobile),
                  const SizedBox(height: 14),
                  _field(
                    'Message',
                    _messageCtrl,
                    maxLines: 4,
                    isMobile: isMobile,
                  ),
                  SizedBox(height: isMobile ? 20 : 28),

                  SizedBox(
                    height: isMobile ? 44 : 48,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _send,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.black,
                              ),
                            )
                          : Text(
                              'Send Message',
                              style: CustomTextStyle.buttonTextBlack().copyWith(
                                fontSize: isMobile ? 13 : 15, // ✅ reduced
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    required bool isMobile,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(
        color: AppColors.white,
        fontSize: isMobile ? 13 : 15, // ✅ input text
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: CustomTextStyle.buttonTextBlack(color: AppColors.subtle)
            .copyWith(fontSize: isMobile ? 12 : 14),
      ),
    );
  }
}

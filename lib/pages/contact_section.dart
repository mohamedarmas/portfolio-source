import 'package:final_site/helper_widgets/custom_textstyle.dart';
import 'package:final_site/helper_widgets/section_wrapper.dart';
import 'package:final_site/helper_widgets/toast.dart';
import 'package:final_site/services/contact_api.dart';
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
    return SectionWrapper(
      child: Container(
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.06),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Contact Me',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.headlinewhite(),
                  ),
                  const SizedBox(height: 32),

                  _field('Name', _nameCtrl),
                  const SizedBox(height: 16),
                  _field('Email', _emailCtrl),
                  const SizedBox(height: 16),
                  _field('Subject', _subjectCtrl),
                  const SizedBox(height: 16),
                  _field('Message', _messageCtrl, maxLines: 4),
                  const SizedBox(height: 28),

                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _send,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Send Message',
                              style: CustomTextStyle.buttonTextBlack(),
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
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: CustomTextStyle.buttonTextBlack(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

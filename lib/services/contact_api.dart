import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class ContactApi {
  static Uri get _endpoint {
    if (ApiConfig.baseUrl.isEmpty) {
      throw Exception('API_URL is not configured');
    }
    return Uri.parse(ApiConfig.baseUrl);
  }

  static Future<String> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final response = await http.post(
      _endpoint,
      headers: const {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name.trim(),
        'email': email.trim(),
        'subject': subject.trim(),
        'message': message.trim(),
      }),
    );

    final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return data['message'] ?? 'Message sent successfully';
    } else {
      throw Exception(data['error'] ?? 'Failed to send message');
    }
  }
}

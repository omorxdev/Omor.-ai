import 'dart:convert';
import 'package:http/http.dart' as http;

/// All provider keys must remain on the server. The Android app only calls this API.
class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;
  static const baseUrl = String.fromEnvironment('API_BASE_URL');

  Future<String> sendChat(String message, {String? ownerToken}) async {
    if (baseUrl.isEmpty) throw StateError('API_BASE_URL is not configured.');
    final response = await _client.post(
      Uri.parse('$baseUrl/v1/chat'),
      headers: {
        'Content-Type': 'application/json',
        if (ownerToken != null) 'Authorization': 'Bearer $ownerToken',
      },
      body: jsonEncode({'message': message}),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('AI service error (${response.statusCode}).');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['reply'] as String? ?? 'No reply returned.';
  }
}

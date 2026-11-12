import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// No login/register flow. Owner activation is a one-time server-verified device unlock.
/// Do not embed the real secret in Dart, assets, or --dart-define for production.
class OwnerUnlockService {
  OwnerUnlockService({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;
  static const _storage = FlutterSecureStorage();
  static const baseUrl = String.fromEnvironment('API_BASE_URL');

  Future<bool> unlock(String secretCode) async {
    if (baseUrl.isEmpty) throw StateError('API_BASE_URL is not configured.');
    final response = await _client.post(
      Uri.parse('$baseUrl/v1/owner/unlock'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'secret_code': secretCode}),
    );
    if (response.statusCode != 200) return false;
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final token = data['owner_token'];
    if (token is! String || token.isEmpty) return false;
    await _storage.write(key: 'owner_token', value: token);
    return true;
  }

  Future<String?> readOwnerToken() => _storage.read(key: 'owner_token');
  Future<void> lock() => _storage.delete(key: 'owner_token');
}

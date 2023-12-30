import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthenticationRepository {
  Future<dynamic> login({required String username, required String password}) async {
    final apiUrl = 'https://dummyjson.com/auth/login';
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to log in');
    }
  }
}

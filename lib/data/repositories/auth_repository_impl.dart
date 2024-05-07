
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blocclean/domain/entities/user.dart';
import 'package:blocclean/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final String baseUrl = 'https://your-api-url.com';

  @override
  Future<User?> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        return User(
          id: userData['id'],
          username: userData['username'],
          email: userData['email'],
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

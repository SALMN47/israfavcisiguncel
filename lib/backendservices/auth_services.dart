import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String apiUrl =
      "http://147.93.123.203/db_folder_structure_new/authentication/user_auth/login_user.php";

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          String token = data['token'];
          String firstName = data['user']['first_name'];
          String lastName = data['user']['last_name'];

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          await prefs.setString('first_name', firstName);
          await prefs.setString('last_name', lastName);

          return {"success": true, "message": "Giriş başarılı!"};
        } else {
          return {
            "success": false,
            "message": data['message'] ?? "Bilinmeyen hata!"
          };
        }
      } else {
        return {
          "success": false,
          "message": "Sunucu hatası. Kod: ${response.statusCode}"
        };
      }
    } catch (e) {
      return {"success": false, "message": "Bağlantı hatası: $e"};
    }
  }
}

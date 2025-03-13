import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String loginUrl =
      "http://147.93.123.203/db_folder_structure_new/authentication/user_auth/login_user.php";
  static const String registerUrl =
      "http://147.93.123.203/db_folder_structure_new/authentication/user_auth/register_user.php";

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {
          'email': email,
          'password': password,
        },
      ).timeout(const Duration(seconds: 30));

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

  Future<Map<String, dynamic>> registerUser({
    required String firstName,
    required String lastName,
    required String gender,
    required String email,
    required String phone,
    required String address,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'gender': gender,
          'email': email,
          'phone': phone,
          'full_address': address,
          'password': password,
        },
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        return {
          "status": "error",
          "message": "Sunucu hatası: ${response.statusCode}"
        };
      }
    } catch (e) {
      return {"status": "error", "message": "Bağlantı hatası: $e"};
    }
  }
}

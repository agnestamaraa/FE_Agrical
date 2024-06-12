import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserManager {
  static const String isLoggedInKey = 'isLoggedIn';
  static const String usernameKey = 'username';
  static const String emailKey = 'email';
  static const String punyaAlatKey = 'punyaAlat';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  static const String loginUrl = 'https://agricalbackend-production.up.railway.app/login'; // Replace with your actual login API URL

  static Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Check if the API returns an error
        if (data['error'] == false) {
          final loginResult = data['loginResult'];

          final returnedUsername = loginResult['username'];
          final email = loginResult['email'];
          final punyaAlat = loginResult['punyaAlat'];
          final accessToken = loginResult['accessToken'];
          final refreshToken = loginResult['refreshToken'];

          // Save login status and user details
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(isLoggedInKey, true);
          await prefs.setString(usernameKey, returnedUsername);
          await prefs.setString(emailKey, email);
          await prefs.setBool(punyaAlatKey, punyaAlat);
          await prefs.setString(accessTokenKey, accessToken);
          await prefs.setString(refreshTokenKey, refreshToken);

          return true;
        } else {
          print(data['msg']);
          return false;
        }
      } else {
        // Handle non-200 status codes
        print('Server returned status code ${response.statusCode}');
        return false;
        
      }
    } catch (e) {
      // Catch other potential exceptions like network issues
      if (e is LoginException) {
        print('Login failed: ${e.message}');
      } else if (e is NetworkException) {
        print('Network error: ${e.message}');
      } else {
        print('Unexpected error during login: $e');
      }
      return false;
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, false);
    await prefs.remove(usernameKey);
    await prefs.remove(emailKey);
    await prefs.remove(punyaAlatKey);
    await prefs.remove(accessTokenKey);
    await prefs.remove(refreshTokenKey);
  }

  static Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }

  static Future<bool> getPunyaAlat() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(punyaAlatKey) ?? false;
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshTokenKey);
  }
}

class LoginException implements Exception {
  final String message;
  LoginException(this.message);

  @override
  String toString() => "LoginException: $message";
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}
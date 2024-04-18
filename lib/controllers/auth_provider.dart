import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_hubb/services/login_API.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController registerUsernameController =
      TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String _token = '';

  String get token => _token;

  final AuthService authService = AuthService();

  Future<void> loginUser() async {
    try {
      _token = (await authService.loginUser(
          usernameController.text, passwordController.text))!;
      if (token != null) {
        _token = token;
        log(_token);
        await saveToSharedPreferences(_token);
      } else {
        log('Failed to retrieve token');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<String?> registerUser() async {
    try {
      if (registerPasswordController.text == confirmPasswordController.text) {
        String? result = await authService.registerUser(
          registerUsernameController.text,
          nameController.text,
          registerPasswordController.text,
        );
        return result;
      } else {
        log("Password does not match");
        return null;
      }
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }

  Future<void> saveToSharedPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', token);
  }
}

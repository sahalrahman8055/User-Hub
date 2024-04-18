import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();

  Future<String?> loginUser(String username, String password) async {
    try {
      String apiUrl = 'https://user-hub-backend-server.vercel.app/user/login';
      final Map<String, dynamic> requestData = {
        "userName": username,
        "password": password
      };
      Response response = await dio.post(apiUrl, data: jsonEncode(requestData));
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        // Handle error cases here
        return null;
      }
    } catch (e) {
      // Handle exceptions here
      return null;
    }
  }

  Future<String?> registerUser(
      String username, String name, String password) async {
    try {
      String apiUrl =
          'https://user-hub-backend-server.vercel.app/user/registration';

      final Map<String, dynamic> requestData = {
        "userName": username,
        "name": name,
        "password": password
      };

      Response response = await dio.post(apiUrl, data: jsonEncode(requestData));
      if (response.statusCode == 200) {
        // Registration successful
        // You may return any necessary data here, or null if not needed
        return "Registration successful";
      } else {
        // Registration failed
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        // Error with response received
        log('Error: ${e.response!.statusCode}, ${e.response!.statusMessage}');
      } else {
        // Other Dio errors (e.g., connection timeout, etc.)
        log('Error: ${e.message}');
      }
      return null;
    } catch (e) {
      // General error handling
      log('Error: $e');
      return null;
    }
  }
}

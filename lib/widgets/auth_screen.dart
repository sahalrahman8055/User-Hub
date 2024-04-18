import 'package:flutter/material.dart';
import 'package:user_hubb/constants/get_token.dart';
import 'package:user_hubb/views/home_screen.dart';
import 'package:user_hubb/views/login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    checktoken();
  }

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      // Token doesn't exist, navigate to login screen
      return LoginScreen();
    } else {
      // Token exists, return an empty widget
      return Container();
    }
  }

  void checktoken() async {
    token = await readToken();
    if (token != null) {
      // Token exists, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }
}

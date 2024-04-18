import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_hubb/constants/get_token.dart';
import 'package:user_hubb/views/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = readToken();
    return Scaffold(
      drawer: Drawer(
        child: IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove('accessToken');

              // Navigate to login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.login_outlined)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Container(
        child: Center(
            child: Container(
                child: IconButton(
                    onPressed: () {
                      print(token);
                    },
                    icon: Icon(Icons.ac_unit_rounded)))),
      ),
      backgroundColor: const Color.fromRGBO(218, 255, 233, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(76, 195, 123, 1.0),
        title: const Text("Home"),
      ),
    );
  }
}

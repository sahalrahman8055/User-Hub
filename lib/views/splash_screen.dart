// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:user_hubb/views/home_screen.dart';
// import 'package:user_hubb/views/login_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({
//     super.key,
//   });

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     checkUserLoggedIn();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Image.asset(
//           'assets/splashscreenimage.png',
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Future<void> gotologin() async {
//     await Future.delayed(const Duration(seconds: 4));
//     Navigator.of(context)
//         .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
//   }

//   Future<void> checkUserLoggedIn() async {
//     final sharedPref = await SharedPreferences.getInstance();
//     final userLoggedIn = sharedPref.getString("accessToken");
//     if (userLoggedIn == null || userLoggedIn == false) {
//       gotologin();
//     } else {
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (ctx) => const HomeScreen()));
//     }
//   }
// }

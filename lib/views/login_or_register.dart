// import 'package:flutter/material.dart';
// import 'package:user_hubb/views/login_screen.dart';
// import 'package:user_hubb/views/register_screen.dart';

// class LOginOrRegister extends StatefulWidget {
//   const LOginOrRegister({super.key});

//   @override
//   State<LOginOrRegister> createState() => _LOginOrRegisterState();
// }

// class _LOginOrRegisterState extends State<LOginOrRegister> {
//   bool showLoginPage = true;

//   void togglepages() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginScreen(onTap: togglepages);
//     } else {
//       return RegisterScreen(
//         onTap: togglepages,
//       );
//     }
//   }
// }

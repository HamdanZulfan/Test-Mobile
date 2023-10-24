// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test_flutter/provider/auth_provider.dart';
// import 'package:test_flutter/screen/home_screen.dart';
// import 'package:test_flutter/screen/login_screen.dart';

// class Wrapper extends StatelessWidget {
//   const Wrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider auth = Provider.of<AuthProvider>(context);
//     return StreamBuilder<User?>(
//       stream: auth.streamAuthStatus(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           return (snapshot.data != null)
//               ? const HomeScreen()
//               : const LoginScreen();
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }

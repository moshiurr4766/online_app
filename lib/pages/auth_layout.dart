import 'package:flutter/material.dart';
import 'package:online_app/mobile/auth_service.dart';
import 'package:online_app/pages/login.dart';
import 'package:online_app/pages/signup.dart';
import 'package:online_app/pages/welcome.dart';

class AuthLayout extends StatelessWidget {
  final Widget? pageIfNotConnected;
  const AuthLayout({super.key, this.pageIfNotConnected});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream:
              authService.authStateChanges, 
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const RegisterPage();
            } else if (snapshot.hasData) {
              widget = const LoginPage();

            } else {
              widget = pageIfNotConnected ?? const HomePage();
            }
            return widget;
          },
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// //import 'package:online_app/mobile/auth_service.dart';
// import 'package:online_app/pages/signup.dart';
// import 'package:online_app/pages/welcome.dart';
// // import 'packageflutter_pro/core/notitiers.dart';
// // import 'app_navigation_layout.dart';

// class AppData {
//   static ValueNotifier<bool> isAuthConnected = ValueNotifier<bool>(false); // false by default
// }

// class AuthLayout extends StatelessWidget {
//   const AuthLayout({super.key,this.pageIfNotConnected});
//   final Widget? pageIfNotConnected;

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: AppData.isAuthConnected,
//       builder: (context, isAuthConnected, child) {
//         if (isAuthConnected) {
//           return const RegisterPage();
//         } else {
//           return pageIfNotConnected ?? const HomePage();
//         }
//       },
//     );
//   }
// }
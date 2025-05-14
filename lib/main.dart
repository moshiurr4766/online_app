

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:online_app/pages/auth_layout.dart';
import 'package:online_app/pages/changepass.dart';
import 'package:online_app/pages/deleteaccount.dart';
import 'package:online_app/pages/login.dart';
import 'package:online_app/pages/resertpass.dart';
import 'package:online_app/pages/signup.dart';
import 'package:online_app/pages/updateusername.dart';
import 'package:online_app/pages/welcome.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint("Firebase initialized successfully!");
  } catch (e) {
    debugPrint("Error initializing Firebase: $e");
  }
  runApp(MaterialApp(title: 'Flutter Demo', home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome',
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/auth': (context) => const AuthLayout(),
        '/welcome': (context) => const HomePage(),
        '/reset': (context) => const ResetPass(),
        '/changepass': (context) => const ChangePassword(),
        '/uuser': (context) => const UsernameInput(),
        '/delete': (context) => const DeleteAccountScreen(),
      },
    );
  }
}

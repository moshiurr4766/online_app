
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_app/mobile/auth_service.dart';

class UsernameInput extends StatefulWidget {
  const UsernameInput({super.key});

  @override
  State<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {

  final TextEditingController usernameController = TextEditingController();
  String errorMessage = '';

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void handleUsernameChange() async {
    try {
      await authService.value.updateUsername(
        usernameController.text.trim(),
      );
      showSnackBarSuccess();
    } on FirebaseAuthException catch (e) {
      setState(() {
        showSnackBarError();
        errorMessage = e.message ?? 'An error occurred';
      });
    }
  }

  void showSnackBarSuccess() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Username changed successfully!'),
        duration: Duration(seconds: 2),
        showCloseIcon: true,
      ),
    );
  }


  void showSnackBarError() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Username not changed successfully!'),
        duration: const Duration(seconds: 2),
        showCloseIcon: true,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Username'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'New Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  handleUsernameChange();
                },
                child: const Text('Change Username'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
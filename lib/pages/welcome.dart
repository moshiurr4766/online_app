



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_app/mobile/auth_service.dart';

class AppData {
  static ValueNotifier<int> navBarCurrentIndexNotifier = ValueNotifier(0);
  static ValueNotifier<int> onboardingCurrentIndexNotifier = ValueNotifier(0);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String displayName = user?.displayName ?? 'No username';
    final String email = user?.email ?? 'No email';

    void popPage() {
      Navigator.pushNamed(context, '/login');
    }

    void logout() async {
      try {
        await authService.value.signOut();
        AppData.navBarCurrentIndexNotifier.value = 0;
        AppData.onboardingCurrentIndexNotifier.value = 0;
        popPage();
      } on FirebaseAuthException catch (e) {
        debugPrint('Error: $e');
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.network(
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),

          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Icon(Icons.account_circle, size: 80, color: Colors.white),
                const SizedBox(height: 20),
                Text('Username: $displayName',
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 12),
                Text('Email: $email',
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 40),

                buildButton(context, 'Login', '/login'),
                buildButton(context, 'Registration', '/register'),
                buildButton(context, 'Update User Name', '/uuser'),
                buildButton(context, 'Change Password', '/changepass'),
                buildButton(context, 'Delete Account', '/delete'),

                ElevatedButton(
                  onPressed: logout,
                  style: buttonStyle(),
                  child: const Text('Logout', style: TextStyle(fontSize: 18)),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildButton(BuildContext context, String label, String route) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: buttonStyle(),
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }

  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white.withOpacity(0.9),
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}

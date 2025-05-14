import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_app/mobile/auth_service.dart';

// Make sure this path matches where AppData is defined

class AppData {
  // Controls the current index of your BottomNavigationBar (if used)
  static ValueNotifier<int> navBarCurrentIndexNotifier = ValueNotifier(0);

  // Controls the current index of onboarding screens (if used)
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
          // Background image from the internet
          SizedBox.expand(
            child: Image.network(
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e', // Replace with your preferred image URL
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay (optional)
          Container(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
          ),

          // Button at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  logout();

                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/changepass');
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Change Password', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0 , 0, 200),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/uuser');
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Update User Name', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),

                    Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0 , 0, 300),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Registration', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0 , 0, 400),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Login', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),

                    Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0 , 0, 500),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/delete');
                },
                style: ElevatedButton.styleFrom(
                
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.white.withOpacity(0.9),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Delete Acount', style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0 , 0, 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Username: $displayName',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Email: $email',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  const Icon(Icons.account_circle, size: 80, color: Colors.blue),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

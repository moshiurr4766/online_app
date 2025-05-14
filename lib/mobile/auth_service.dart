
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn( {
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  // Future<void> updateUsername(String username) async{
  //   await currentUser!.updateDisplayName( username);
  // }

  Future<void> updateUsername(String newUsername) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    throw FirebaseAuthException(
      code: 'user-not-logged-in',
      message: 'No user is currently signed in.',
    );
  }

  await user.updateDisplayName(newUsername);
  await user.reload(); // Refresh currentUser data
}


  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    final credential = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    final credential = EmailAuthProvider.credential(email: email, password: currentPassword);
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }


  //   Future<void> resetPasswordFromCurrentPassword({
  //       required String currentPassword,
  //       required String newPassword,
  //       required String email,
  //     }) async {
  //       final user = FirebaseAuth.instance.currentUser;

  //       if (user == null) {
  //         throw FirebaseAuthException(
  //           code: 'user-not-logged-in',
  //           message: 'No user is currently signed in.',
  //         );
  //       }

  //       // Reauthenticate the user
  //       final credential = EmailAuthProvider.credential(
  //         email: email,
  //         password: currentPassword,
  //       );
  //       await user.reauthenticateWithCredential(credential);

  //       // Update the password
  //       await user.updatePassword(newPassword);
  // }



}



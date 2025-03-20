import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:competify_app/presentation/pages/home/home_page.dart';

class AuthController {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      _showError(e, context);
    }
  }

  static Future<void> signUp(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      _showError(e, context);
    }
  }

  static void _showError(FirebaseAuthException e, BuildContext context) {
    String errorMessage = {
      'user-not-found': 'User not found. Please sign up.',
      'wrong-password': 'Incorrect password. Try again.',
      'email-already-in-use': 'Email is already registered.',
    }[e.code] ?? 'Authentication failed';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
}

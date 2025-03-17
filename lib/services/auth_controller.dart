// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  static Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _showError(e, context);
    }
  }

  static void _showError(FirebaseAuthException e, BuildContext context) {
    String errorMessage =
        {
          'user-not-found': 'User not found. Please sign up.',
          'wrong-password': 'Incorrect password. Try again.',
          'email-already-in-use': 'Email is already registered.',
        }[e.code] ??
        'Authentication failed';

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:competify_app/presentation/pages/home/home_page.dart';

class AuthController {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 🔹 Login User
  static Future<void> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      // Menampilkan loading
      _showLoading(context, "Masuk...");

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
        String username = userDoc.exists ? userDoc.get('username') : 'User';

        // Navigasi ke HomePage tanpa kembali ke login
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      _showError(e, context);
    }
  }

  /// 🔹 Register User
  static Future<void> signUp(
    String username,
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      // Menampilkan loading
      _showLoading(context, "Mendaftar...");

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Navigasi ke HomePage tanpa kembali ke login
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      _showError(e, context);
    }
  }

  /// 🔹 Logout User
  static Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  /// 🔹 Menampilkan Error
  static void _showError(FirebaseAuthException e, BuildContext context) {
    String errorMessage = {
      'user-not-found': 'User tidak ditemukan. Silakan daftar.',
      'wrong-password': 'Password salah. Coba lagi.',
      'email-already-in-use': 'Email sudah digunakan.',
    }[e.code] ?? 'Autentikasi gagal. Coba lagi.';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }

  /// 🔹 Menampilkan Loading Dialog
  static void _showLoading(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text(message),
            ],
          ),
        );
      },
    );
  }
}

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
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Ambil username dari Firestore
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
        String username = userDoc.exists ? userDoc.get('username') : 'User';

        // Navigasi ke HomePage dengan username
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
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
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Simpan data ke Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });

        // Navigasi ke HomePage dengan username
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      _showError(e, context);
    }
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
}

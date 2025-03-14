import 'package:firebase_core/firebase_core.dart';
import 'package:competify_app/firebase_options.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Menambahkan data grup baru ke koleksi 'groups'
  Future<void> addGroupDetails(Map<String, dynamic> groupInfoMap) async {
    try {
      await _firestore.collection("groups").add(groupInfoMap);
    } catch (e) {
      print("Error saat menambahkan grup: $e");
    }
  }

  // Mendapatkan informasi pengguna berdasarkan nama
  Future<QuerySnapshot> getThisUserInfo(String name) async {
    try {
      return await _firestore
          .collection("users")
          .where("First Name", isEqualTo: name)
          .get();
    } catch (e) {
      print("Error saat mengambil data pengguna: $e");
      rethrow;
    }
  }

  // Memperbarui usia pengguna berdasarkan ID dokumen
  Future<void> updateUserData(String age, String id) async {
    try {
      await _firestore.collection("users").doc(id).update({"Age": age});
    } catch (e) {
      print("Error saat memperbarui data pengguna: $e");
    }
  }

  // Menghapus pengguna berdasarkan ID dokumen
  Future<void> deleteUserData(String id) async {
    try {
      await _firestore.collection("users").doc(id).delete();
    } catch (e) {
      print("Error saat menghapus data pengguna: $e");
    }
  }
}

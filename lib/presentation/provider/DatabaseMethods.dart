import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addGroupDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set(userInfoMap);
  }
}
//   Future<QuerySnapshot> getthisUserInfo(String name) async {
//     return await FirebaseFirestore.instance
//         .collection("users")
//         .where("First Name", isEqualTo: name)
//         .get();
//   }

//   Future UpdateUserData(String age, String id) async {
//     return await FirebaseFirestore.instance
//         .collection("users")
//         .doc(id)
//         .update({"Age": age});
//   }

// Future DeleteUserData(String id)async{
//   return await FirebaseFirestore.instance.collection("users").doc(id).delete();
// }
// }

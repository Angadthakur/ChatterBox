//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {

  final FirebaseAuth _auth = FirebaseAuth.instance; 

// To add user details to firestore
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }
// Email Query 
  Future<QuerySnapshot> getUserbyemail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("E-mail", isEqualTo: email)
        .get();
  }

//Username Query
  Future <List<QueryDocumentSnapshot>> getUserByUsername(String username) async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").where("username", isGreaterThanOrEqualTo: username)
        .where("username", isLessThanOrEqualTo: username + '\uf8ff')
        .get();

        return querySnapshot.docs;
  }

  //Sign Out 
  Future<void> signOut() async{
    return await _auth.signOut();

  }


}




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/model/User_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUser {


  CollectionReference _collectionReference = FirebaseFirestore.instance.collection("Users") ; 


  Future<void> AddUsertoFirestore(UserModel userModel ) async {
   await _collectionReference.doc(userModel.userId).set(
      userModel.toJson() ) ; 

  }

  Future<DocumentSnapshot> getCurrentUser(String uid ) async {
    return await _collectionReference.doc(uid).get() ; 
  } 

}






















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app/core/model/User_Model.dart';
// import 'package:firebase_core/firebase_core.dart';

// class FirestoreUser  {

//   final CollectionReference _UserColoecionRef = FirebaseFirestore.instance.collection("Users") ;

//   Future<void> AddUsertoFirestore ( UserModel userModel ) async {

//   return await  _UserColoecionRef.doc(userModel.userId).set(userModel.toJson()) ; 

//   }


// }
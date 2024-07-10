


import 'package:e_commerce_app/core/model/User_Model.dart';
import 'package:e_commerce_app/core/view/pages/homePage.dart';
import 'package:e_commerce_app/core/view/view_Conroller.dart';
import 'package:e_commerce_app/helper/local_Storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce_app/core/services/firestore_User.dart';

class AuthViewModel extends GetxController {

  LocalStorageData localStorageData = Get.find<LocalStorageData>() ; 

  String? email , password , name ;
  bool _isLoading = false  ; 
  Rx<User?> _user = Rx<User?>(null) ;
    

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email'] ); 
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance ; 

  get isLoading => _isLoading ; 
  get user => _user.value?.email ;  

  @override
  void onInit() {
    print(_firebaseAuth.currentUser) ; 
    if(_firebaseAuth.currentUser != null ) {
    getCureentUserData(_firebaseAuth.currentUser!.uid) ; 
    }
    super.onInit() ;
    _user.bindStream(_firebaseAuth.authStateChanges()) ; 
    
    
  }

  void signInWithGoogle () async {

  final GoogleSignInAccount?  googleUser = 
  
  await  _googleSignIn.signIn() ; 

  print("======================== ${googleUser}")  ;


  GoogleSignInAuthentication googleSignInAuthentication = await 
  googleUser!.authentication ; 

 final AuthCredential credential  = GoogleAuthProvider.credential(
    idToken: googleSignInAuthentication.idToken , 
    accessToken:  googleSignInAuthentication.accessToken ,
  ) ; 

  await _firebaseAuth.signInWithCredential(credential).then((value) async {
    saveUser(value)  ;
  }
  
  ) ; 
  
  Get.to(homePage()) ; 

  }

  void signInWithEmailAndPassword () async { //we must also add the user info from firebase to shared pref 

    try {
  _isLoading = true ; 
  update() ;     
  final credential = await _firebaseAuth.signInWithEmailAndPassword(
    email: email!,
    password: password!
  ).then((value) {
    
       getCureentUserData(value.user!.uid) ; 

  }
  );
  _isLoading = false ;  
  Get.to(()=> viewController()) ; 
} on FirebaseAuthException catch (e) {
  print(e.message) ; 

   Get.snackbar(
     "Error login account",
     e.message! , 
     colorText: Colors.black , 
     snackPosition: SnackPosition.BOTTOM 
       ); 
  
}


  }

  Future<void> createUserWithEmailAndPassword () async {

    try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email!,
    password: password!,

  // ).then((user) async { 
  // UserModel userModel = UserModel(
  //   userId: user.user?.uid, 
  //   email: user.user?.email, 
  //   name: name , 
  //   pic: ""
  // )  ;

  // FirestoreUser firestoreUser = FirestoreUser() 
  // await firestoreUser.AddUsertoFirestore(userModel) ; 
  // }
  
  ).then((value) async {
  
    saveUser(value) ;

  } 
  
  
  ) ; 


  Get.to(()=> viewController()) ; 
} on FirebaseAuthException catch (e) {
  
  Get.snackbar(
     "Error Resister Account",
     e.message! , 
     colorText: Colors.black , 
     snackPosition: SnackPosition.BOTTOM 
     ); 
  
  // if (e.code == 'weak-password') {
  //   print('The password provided is too weak.');
  // } else if (e.code == 'email-already-in-use') {
  //   print('The account already exists for that email.');
  // }
} catch (e) {
  print(e);
}

  }


  void saveUser (UserCredential value) async { 
    UserModel userModel = UserModel(
      userId: value.user!.uid   , 
      email: value.user!.email ,
      name: name , 
      pic:  "" ,   
    )  ; 
    await FirestoreUser().AddUsertoFirestore(userModel); 
    setUser(userModel) ; 


  }

  void setUser (UserModel userModel) async {


    await localStorageData.setUserData(userModel);  


  }

  void getCureentUserData(String uid) async {
     await  FirestoreUser().getCurrentUser(uid).then((value) {
        setUser(UserModel.FromJson(value.data() as Map)) ; 
       }) ;  
  }






}
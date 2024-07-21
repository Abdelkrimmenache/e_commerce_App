
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/adminApp/core/adminModel/userAdminModel.dart';
import 'package:e_commerce_app/adminApp/core/adminView/adminPages/homeView.dart';
import 'package:get/get.dart';

class adminAuthViewModel extends GetxController {
 

 String? username , password ; 
 CollectionReference _admincollectionReference = FirebaseFirestore.instance.collection("admin")  ;
  



  
   //th admin part 
  bool get isAdmin => _isAdmin ; 
  bool _isAdmin = false ; 

    void toggleIsAdmin() {
    _isAdmin = !_isAdmin;
    print("###################### $_isAdmin");
    update(); // Notify listeners to update UI
  }

  Future<void> signInWithEmailAndPassword() async {
  
  await _admincollectionReference.get().then((snapshot) {
    
     for (var doc in snapshot.docs) {
     var userAdminModel = UserAdminModel.fromJson(doc.data() as Map ) ; 
       if (userAdminModel.username == username!.trim() && userAdminModel.password == password!.trim() ) {
         Get.offAll(()=> HomeView(username: userAdminModel.username! ,) ) ;  
         print("#########verification") ; 
         break; 
      } else{
       Get.snackbar("somthing went worng", "username or password are incorrect") ; 
      }
     
     }

  }) ; 
  }

  getUserAdmin () async {
    
  }





}
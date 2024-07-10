import 'package:e_commerce_app/core/model/User_Model.dart';
import 'package:e_commerce_app/core/view/view_Conroller.dart';
import 'package:e_commerce_app/helper/local_Storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class profileViewModel extends GetxController {

  UserModel  get userMoldel => _userModel! ; 
  UserModel? _userModel  ;  

  @override
  void onInit() {
    getUserModel() ; 
  
    super.onInit();
  }

 var localStorageData = Get.find<LocalStorageData>() ; 
 FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;  

  void signOut ()  async {
    
    await _firebaseAuth.signOut();
    await FirebaseAuth.instance.signOut() ; 
    localStorageData.deleteUser() ; 
    
    
  }

  void getUserModel () async {

   UserModel? value =  await localStorageData.getUser ; 
   _userModel = value ; 
   
  }
  
  






}
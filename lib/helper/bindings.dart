
import 'package:e_commerce_app/core/viewmodel/auth_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/cart_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/checkOut_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/controller_home_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/home_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/profile_View_Model.dart';
import 'package:e_commerce_app/helper/local_Storage_data.dart';
import 'package:get/get.dart';

class MyBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel()) ; 
    Get.lazyPut(() => ControllerHomeViewModel()) ;  
    Get.lazyPut(() => HomeViewModel()) ;  
    Get.lazyPut(() => CartViewModel()) ;  
    Get.lazyPut(() => LocalStorageData()) ;  
    Get.lazyPut(() => profileViewModel()) ;  
    Get.lazyPut(() => checkOutViewModel()) ;  
    
  }

}
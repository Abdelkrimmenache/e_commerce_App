
import 'dart:convert';

import 'package:e_commerce_app/core/model/User_Model.dart';
import 'package:e_commerce_app/helper/constance.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {

Future<UserModel?> get getUser   async {
  try {
     UserModel userModel = await _getUserData() ;    
     if (userModel == null ) {
      return null ;
      } 
      return userModel ;
     } catch(e) {
      print(e.toString()) ; 
     }
        
  }


  _getUserData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ;  
  var value  = sharedPreferences.getString(CACHED_USER_DATA) ; //we must return this value ; 
  return UserModel.FromJson(json.decode(value!)) ; 
  
}

setUserData(UserModel userModel)  async {

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ; 
  sharedPreferences.setString(CACHED_USER_DATA , json.encode(UserModel(
    name: userModel.name , 
    email: userModel.email ,
    pic: userModel.pic , 
    userId: userModel.userId , 
  ).toJson())) ;
}



void deleteUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance() ; 
  await sharedPreferences.clear() ; 
}









}











// _getUserData() async {
//  SharedPreferences sharedPreferences =await SharedPreferences.getInstance() ; 
//  var value =  await sharedPreferences.getString(CACHED_USER_DATA) ; 


// }

// _setUserData(userModel) async {
//   SharedPreferences sharedPreferences =await SharedPreferences.getInstance() ; 
//   var value =  sharedPreferences.setString(CACHED_USER_DATA, json.encode(UserModel(
//     userId: userModel.userId,
//     name: userModel.name , 
//     email: userModel.email , 
//     pic: userModel.pic, 
    
//   )));

// }

 




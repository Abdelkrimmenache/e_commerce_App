import 'package:http/http.dart';
import 'dart:convert';




class UserModel {

String? userId , name , email , pic ;

UserModel({this.userId ,this.name , this.email , this.pic}) ;   

UserModel.FromJson(Map<dynamic , dynamic > map ) {
  if(map == null ) {
    return ; 

  }
  userId = map['userId'] ; 
  name = map['name'] ; 
  email = map['email'] ; 
  pic = map['pic'] ; 
  


}

  toJson ( ) { 
  return
  {
  'userid' : userId ,  
  'name' : name ,  
  'email' : email ,  
  'pic' : pic ,  
  

  } ; 

}

}





// class UserModel  {


//   String? userId , email , name , pic ;
//   UserModel({this.userId , this.email , this.name , this.pic }) ;  

//   UserModel.fromJson(Map <dynamic , dynamic> map  ) {
//     if (map == null )  {
//       return  ; 
//     }

//     userId = map['UserId']  ;
//     email = map['email']  ;
//     name = map['name']  ;
//     pic = map['pic']  ;
    

//   } 

//   toJson() {
//     return {
//       'userId' : userId , 
//       'email' : email , 
//       'name' : name , 
//       'pic' : pic , 


//     } ; 
//   }
   

  
    

// }
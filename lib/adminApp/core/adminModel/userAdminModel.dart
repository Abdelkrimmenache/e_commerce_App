
class UserAdminModel {

 String? password  ; 
 String ? username ;

 UserAdminModel({this.username , this.password})  ;




 
   UserAdminModel.fromJson(Map<dynamic, dynamic> map) {
   if ( map == null ) {
    return ; 
   }
   password = map['password'] ; 
   username = map['username']  ; 
   
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'id': username,
      
    };
  }


} 











 
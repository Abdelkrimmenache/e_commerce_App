

import 'package:e_commerce_app/core/model/cart_Item_Model.dart';
import 'package:e_commerce_app/helper/constance.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDataBaseHelper {
  
 CartDataBaseHelper._() ; 
 static final CartDataBaseHelper db = CartDataBaseHelper._()  ; 
 
 static  Database? _database ;

   get database async  {
  if (_database != null) { //if database exist
  return _database ; 
  }
  
  _database = await initdb() ;  
  return _database  ;  
 
 }

 //inisialize databse : 
 
  initdb()async {
  String path =   join(await  getDatabasesPath() , 'CartData.db') ; 
  return await openDatabase(path , version: 1  , 
  onCreate: (Database db , int version ) async {
    await db.execute('''
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL  ,  
      $columnImage TEXT NOT NULL  , 
      $columnPrice REAL NOT NULL  , 
      $columnQuantity INTEGER NOT NULL , 
      $columnProductId TEXT NOT NULL  
      )
      ''') ; 
    
  }
  
  ) ; 
  }  


 //insert : 

  InsertProduct (CartProductModel cartProductModel ) async {
 
  var dbClient = await database ; 
  await dbClient?.insert(
  tableCartProduct ,
  cartProductModel.toJson() , 
  conflictAlgorithm: ConflictAlgorithm.replace , 
  ) ; 

 }

 //read getAllUser : 

Future<List<CartProductModel>> getAllProduct() async {
  var dbClient = await database ; 
  List<Map> maps =  await dbClient.query(tableCartProduct)  ; 
  return maps.isNotEmpty? 
   maps.map((product) => CartProductModel.fromJson(product)).toList() 
   : []  ; 

}


updateProduct(CartProductModel cartProductModel) async {

  var dbClient = await database  ; 
  return await dbClient.update(
    tableCartProduct ,
    cartProductModel.toJson() , 
    where : '$columnProductId =?' , whereArgs : [cartProductModel.productId] 
    ) ; 


}

 


//Update : 

// Future <void> UpdateUser (CartProductModel user ) async {

//  var dbClient = await database ;   
//  dbClient.update(
//   tableCartProduct, 
//   user.tojson() , 
//   where: '$columnId = ?' , 
//   whereArgs:  [user.id] , 
//   );

// }

// Future<CartProductModel?> getUser (int id ) async {
 
//  var dbClient = await  database ;
//  List<Map> maps =  await dbClient.query(
//   tableCartProduct , 
//   where: '$columnId = ?' , 
//   whereArgs: [id] ,  

//    ) ;  

//    if(maps.length > 0 ) {
//     return CartProductModel.fromJson(maps.first) ; 
//    } else {
//     return null ; 
//    }
// }


// Future<List<CartProductModel>> getAllUser() async {
//   var dbClient = await database ; 
//   List<Map> maps =  await dbClient.query(tableCartProduct) ; 

//   return maps.isEmpty? maps.map((User) => CartProductModel.fromJson(User) ).toList() : []  ; 

// }


// Future<void> deleteUser (int id) async {
//   var dbClient = await database ; 
//   await dbClient.delete(
//     tableCartProduct , 
//     where: '$columnId = ?'  ,
//     whereArgs: [id] , 
//     ) ; 
  
// }





 


}
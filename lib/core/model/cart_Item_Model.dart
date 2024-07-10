import 'package:e_commerce_app/helper/extension.dart';
import 'package:flutter/material.dart';

class CartProductModel {

  String? image , name , productId ;
 double? price ;
 int? quantity ;

 CartProductModel({this.image , this.name , this.price , this.quantity  , this.productId}) ; 


 CartProductModel.fromJson(Map<dynamic , dynamic > map ) {
  if(map == null ) {
    return ; 
  }
 
 image = map['image'] ; 
 name = map['name'] ; 
 quantity = map['quantity'] ; 
 price  = map['price'] as double  ; 
 productId = map['productId'] ; 
 

 }

 toJson() {
  return 
  {
    'image' : image , 
    'name' : name , 
    'quantity' :quantity , 
    'price' : price , 
    'productId' : productId , 
  };
 }


}
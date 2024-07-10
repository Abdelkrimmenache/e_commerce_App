

import 'package:e_commerce_app/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductModel {

 String? image , title , description  , sized , productId  ;
 Color? color ;  
 double? price ;

 ProductModel({this.image , this.title ,this.description ,  this.price , this.color , this.sized , this.productId }) ; 


 ProductModel.fromJson(Map<dynamic , dynamic > map ) {
  if(map == null ) {
    return ; 
  }
 
 image = map['image'] ; 
 title = map['title'] ; 
 description = map['description'] ; 
 price = map['price'] as double ; 
 color = HexColor.fromHex(map['color']) ; 
 sized = map['sized'] ; 
 productId = map['productId'] ; 

 }

 toJson() {
  return 
  {
    'image' : image , 
    'title' : title , 
    'description' : description , 
    'price' : price , 
    'color' : color , 
    'sized' : sized  , 
    'productId' : productId  , 
  };
 }


}





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/model/Product_Model.dart';
import 'package:e_commerce_app/core/model/cart_Item_Model.dart';
import 'package:e_commerce_app/core/services/dataBase/cart_DataBase_Helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

   ValueNotifier<bool>  get loading => _loading     ; 
  ValueNotifier<bool>  _loading = ValueNotifier(false)  ;
  List<CartProductModel> _cartProductModel = []  ; 
  List<CartProductModel> get cartProductModel => _cartProductModel   ; 

  double get tatalPrice => _totalPrice ; 
   double _totalPrice = 0.0  ; 
    

  CartViewModel ()  {
    getAllProduct() ; 
    
  }

   getAllProduct () async {
    _loading.value = true  ; 
    var dbhelper =  CartDataBaseHelper.db ;
    _cartProductModel =  await dbhelper.getAllProduct() ; 
    print(_cartProductModel.length) ; 

     _loading.value = false   ; 
      getTotalPrice () ; 
     update() ; 
    

  }

  addProduct (CartProductModel cartProductModel) async {
    if(_cartProductModel.length == 0 ) {
    var dbhelper = CartDataBaseHelper.db ;  
    await dbhelper.InsertProduct(cartProductModel) ; 
    _cartProductModel.add(cartProductModel) ; 
    }

    for ( int i = 0  ; i<_cartProductModel.length ; i++ ) {
      if(cartProductModel.productId == _cartProductModel[i].productId ) {
        //  _cartProductModel[i].quantity = _cartProductModel[i].quantity! + 1 ;  
        return ; 
      } 
    }

    var dbhelper = CartDataBaseHelper.db ;  
    await dbhelper.InsertProduct(cartProductModel) ; 
    _cartProductModel.add(cartProductModel) ; 
    
    update()  ;  //to refrech UI 

  }

   getTotalPrice () {
   
    for (int i = 0 ; i<_cartProductModel.length; i++ ) {
       _totalPrice +=  (_cartProductModel[i].price!) * (_cartProductModel[i].quantity!);    
   print(_totalPrice) ; 
    
    }

    update();

  }


  increaseQuantity(int index) async {
  _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1    ; 
   _totalPrice +=  (_cartProductModel[index].price!);
   await upddateThisProduct(index) ; 
  update() ; 
  }

  decreaseQuantity(int index) async {
  _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1    ; 
   _totalPrice -=  (_cartProductModel[index].price!) ;
   await upddateThisProduct(index) ; 
   update() ;
  }

  upddateThisProduct (int index) {
    var dbhelper = CartDataBaseHelper.db ;  
    return dbhelper.updateProduct(_cartProductModel[index]) ; 
  }


  bool isCartEmpty () {
    if(cartProductModel.length == 0 ) {
      return true ; 
    }
    return false ; 
  }










 
 



 










}
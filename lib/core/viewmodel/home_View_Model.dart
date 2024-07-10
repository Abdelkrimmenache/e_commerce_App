

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/model/Product_Model.dart';
import 'package:e_commerce_app/core/model/catergory_Model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/model/Product_Model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _Loading ; 
  ValueNotifier<bool> _Loading = ValueNotifier(false) ; 

 List<CategoryModel> _categoryModel = [] ; 
 List<CategoryModel>  get categoryModel => _categoryModel ; 
 List<ProductModel> _productModel = [] ; 
 List<ProductModel>  get productModel => _productModel ; 

CollectionReference _categoryColleceionRef = FirebaseFirestore.instance.collection("Category") ;
CollectionReference _productColleceionRef = FirebaseFirestore.instance.collection("product") ;

HomeViewModel()  {
   getCategory() ; 
   getBestsellingProduct() ; 
} 


getCategory () async {
  _Loading.value = true ; 
  await  _categoryColleceionRef.get().then((value) {
    
   
   for(int i = 0 ; i<value.docs.length ; i++ ) {
    _categoryModel.add(CategoryModel.fromJson(value.docs[i].data() as Map));
    print(_categoryModel.length) ; 
    _Loading.value = false ; 
   }
   update() ; 

  }
  
  ) ; 
  // .then((value) {
    
  //   for(int i=0 ; i<value.docs.length ; i++ ) {
  //     _categoryModel.add(
  //       CategoryModel.fromJson(
  //       value.docs[i].data() 
  //     ));

  //   }
  
  // }
  // ) ; 


}

getBestsellingProduct() async {

  await  _productColleceionRef.get().then((value) {

    for (int i = 0 ; i<value.docs.length ; i++) {
     
      _productModel.add(
        ProductModel.fromJson(value.docs[i].data() as Map ) 
      ) ;  
      print("#################################${_productModel.length}") ; 
    }
      update();
    


  }) ;  




}




}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/model/Product_Model.dart';
import 'package:get/get.dart';

class FirestoreProduct extends GetxController {

  DocumentReference<Object?> get productCollectionRef => _productCollectionRef.doc() ; 
  CollectionReference  _productCollectionRef = FirebaseFirestore.instance.collection("product") ; 



  AddProductToFirestore (ProductModel productModel) async{
    await _productCollectionRef.doc(productModel.productId).set(
      productModel.toJson()   

   );
   print("################## ${productModel.toJson()}") ; 
  

  }

  deleteProductFromFirestore (ProductModel productModel) async{
    await _productCollectionRef.doc(productModel.productId).delete() ;   

  
   print("################## ${productModel.toJson()}") ; 
  

  }








}
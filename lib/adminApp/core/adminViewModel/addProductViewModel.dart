

import 'dart:io';

import 'package:e_commerce_app/adminApp/services/Firestore_Product.dart';
import 'package:e_commerce_app/core/model/Product_Model.dart';
import 'package:e_commerce_app/helper/extension.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddProductViewModel extends GetxController {


  bool isLoading = false ; 
  ImagePicker _picker = ImagePicker() ; 
  File? get selctedImage => _selctedImage ;
  File? _selctedImage ;   
  String? name , description ,  image , color , ImageLink ;
  XFile? imagecamera ; 


  double? price ; 


 saveProduct ( ) async {
  if (_selctedImage != null ) {
  isLoading = true ; 
 await addImage() ; 
  ProductModel productModel = ProductModel(
  color: HexColor.fromHex(color!) ,
  description: description  , 
  image: image, 
  price: price , 
  sized: size , 
  title: name , 
  productId: FirestoreProduct().productCollectionRef.id ,  

  ) ; 
   
  await FirestoreProduct().AddProductToFirestore(productModel) ; 
   print("############################################${productModel.image}")  ; 
   isLoading = false ; 
   SnackBar(
   content: 
   Text("product aded succfully")
   ) ;
   update() ; 
  //  print("######################## ${productModel.color.toString()}")  ;
  } else {
    Get.snackbar(
      "input error" , 
       "you have to add a picture to your product" , 
      snackPosition: SnackPosition.BOTTOM
      
      ) ; 
  }
 }

  String? size ; 
 onsaved ( String Value) {
  size = Value ; 
  update() ; 
 }

 getImage () async {
 
   imagecamera = await _picker.pickImage(source: ImageSource.camera) ;
  if(imagecamera != null ) {
  _selctedImage = File(imagecamera!.path) ; 
 
  }
  update()  ;
 }
 
 addImage() async  {
  if(_selctedImage != null ) {
  var imagename = basename(imagecamera!.path) ; 
  var refstorage =  FirebaseStorage.instance.ref(imagename) ; 
  await refstorage.putFile(_selctedImage!) ; 
   image = await refstorage.getDownloadURL() ;
   print("###################################################### imgag url : $image");
  }
 }


  UpdateProduct (String? productId) async {

  isLoading = true ; 
 await addImage() ; 
  ProductModel productModel = ProductModel(
  color: HexColor.fromHex(color!) ,
  description: description  , 
  image: (_selctedImage != null ) ? image : ImageLink  , 
  price: price , 
  sized: size , 
  title: name , 
  productId: productId ,  

  ) ; 
   
  await FirestoreProduct().AddProductToFirestore(productModel) ; 
   print("############################################${productModel.image}")  ; 
   isLoading = false ; 
   Get.snackbar(
    "" , 
    "product updated seccfully"
   ) ; 
   update() ; 
  //  print("######################## ${productModel.color.toString()}")  ;
  
 }

 deleteProduct (ProductModel productModel) {
  FirestoreProduct().deleteProductFromFirestore(productModel) ; 
  update() ; 
 }







}
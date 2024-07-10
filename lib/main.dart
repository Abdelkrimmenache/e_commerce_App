import 'dart:io';

import 'package:e_commerce_app/core/view/auth/login_Screen.dart'  ;
import 'package:e_commerce_app/core/view/auth/sign_Up_Screen.dart';

import 'package:e_commerce_app/core/view/view_Conroller.dart'    ; 
import 'package:e_commerce_app/helper/bindings.dart'              ;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized() ;
  Platform.isAndroid? 
  await Firebase.initializeApp (
    options: const FirebaseOptions(
    apiKey: 'AIzaSyABtxlKm58sfhxTZDQMPcf7U74QCriJ_hQ' , //
    appId: '1:570205347594:android:96184b030129f5fcef24f3', 
    messagingSenderId: '570205347594' , 
    projectId: 'ecommerceapp-3a5a4'   , 
    storageBucket: 'ecommerceapp-3a5a4.appspot.com' , 
    // messagingSenderId: "604005378047",
    )
    ) 
  :await Firebase.initializeApp() ;
  runApp(const MyApp())           ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 238, 238, 238) , 
        primaryColor: Color.fromARGB(255, 237, 234, 234) ,
        fontFamily: 'myfont' 


      ),
      initialBinding: MyBidings(),
      home: viewController() ,

      
    ) ; 
  }
}

//mvvm ----> model

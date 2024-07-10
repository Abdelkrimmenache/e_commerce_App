

import 'package:e_commerce_app/core/view/auth/login_Screen.dart';
import 'package:e_commerce_app/core/view/pages/cart_View.dart';

import 'package:e_commerce_app/core/view/pages/homePage.dart';
import 'package:e_commerce_app/core/view/pages/profile_View.dart';
import 'package:e_commerce_app/core/viewmodel/auth_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/controller_home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class viewController extends GetWidget<AuthViewModel> {

 
  
   

   viewController({super.key});

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
      return (Get.find<AuthViewModel>().user == null )  ?  loginScreen()
      : GetBuilder<ControllerHomeViewModel>(
      builder: (controller) =>   
       Scaffold(
        body: controller.currentScreen , 
        bottomNavigationBar: bottomNavigationBar() ,
        ),
      ); 
      
         


      

    }
    
    ) ; 
  }
  Widget bottomNavigationBar(){
    return
   GetBuilder<ControllerHomeViewModel>(
        init: ControllerHomeViewModel(), 
        builder: (controller) => 
           BottomNavigationBar(
          items: [
        
            BottomNavigationBarItem(
              activeIcon: Text("Explore" , style: TextStyle(fontWeight: FontWeight.w500),),
              icon: Icon(Icons.travel_explore) , 
              label: "" ,       
              ) , 
            BottomNavigationBarItem(
              activeIcon: Text("Cart" , style: TextStyle(fontWeight: FontWeight.w500),),
              icon: Icon(Icons.shopping_cart) , 
              label: ""  ,       
              ) , 
            BottomNavigationBarItem(
              activeIcon: Text("Account" , style: TextStyle(fontWeight: FontWeight.w500), ),
              icon: Icon(Icons.person)  , 
              label: "" ,       
              ) , 
        
          ] , 
          currentIndex: controller.navigatorValue  , 
          onTap: (Index) {
            controller.changeSelectedValue(Index) ; 
          },
          ),
      ) ; 



  }
} 


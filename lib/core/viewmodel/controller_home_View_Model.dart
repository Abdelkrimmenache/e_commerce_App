

import 'package:e_commerce_app/core/view/pages/cart_View.dart';
import 'package:e_commerce_app/core/view/pages/homePage.dart';
import 'package:e_commerce_app/core/view/pages/profile_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerHomeViewModel extends GetxController {
  Widget _currentScreen = homePage() ; 
  int _navigatorValue = 0  ; 

  get navigatorValue => _navigatorValue ; 
  get currentScreen => _currentScreen ; 

  void changeSelectedValue ( int selectedValue)  {
    _navigatorValue = selectedValue ; 

       switch(selectedValue) {
              case 0 : {
                _currentScreen = homePage() ;
                break ; 
              } 
              case 1 : {
                _currentScreen = CartView() ;
                break ; 
              }
              case 2 : {
                _currentScreen = ProfileView() ;
                break ; 
              }
            }
    update()  ; 

  }

}
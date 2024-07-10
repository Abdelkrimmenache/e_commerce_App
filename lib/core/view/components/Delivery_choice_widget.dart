

import 'package:e_commerce_app/core/viewmodel/checkOut_View_Model.dart';
import 'package:e_commerce_app/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


 

class DelivertChoice extends StatelessWidget {
    
   String title    ; 
   String subtitle ; 
   Delivery value ; 
   DelivertChoice({super.key , required this.title , required this.subtitle , required this.value });
  
  var controller = Get.find<checkOutViewModel>() ; 

  @override
  Widget build(BuildContext context) {
    return 
    GetBuilder<checkOutViewModel>(
       builder: (controller) => 
       Padding(
                padding: const EdgeInsets.only(bottom: 15 ), 
                child: RadioListTile<Delivery>(value: value , groupValue: controller.delivery! ,
                 onChanged: (value) {
                  controller.changeVlue(value) ; 
                  print(value.toString()) ; 
                } , 
                title: 
                Text( title , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold)) , 
                subtitle: 
                Text(subtitle  , style: TextStyle(fontSize: 18 )),
                ),
              ),
    ) ;
  }
}
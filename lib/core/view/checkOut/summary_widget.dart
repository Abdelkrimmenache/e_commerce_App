

import 'package:e_commerce_app/core/view/components/Delivery_choice_widget.dart';
import 'package:e_commerce_app/core/view/components/custom_Product_widjet.dart';
import 'package:e_commerce_app/core/viewmodel/cart_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/checkOut_View_Model.dart';
import 'package:e_commerce_app/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';

class summary extends StatelessWidget {
   summary({super.key});
   var controller = Get.find<CartViewModel>() ;  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15) , 
         child: GetBuilder<CartViewModel>(
          init: controller ,
          builder:  (controller) => 
            Column(
           mainAxisAlignment: MainAxisAlignment.center ,
           children: [
             SizedBox(height: 50 ,) , 
             Row(
               children: [
                 IconButton(
                 icon: Icon(Icons.arrow_back_ios)  ,
                 onPressed: () {
                   
                 },
                  ) , 
                 SizedBox(width: MediaQuery.of(context).size.width*0.3,) , 
                 Text("summary" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),) , 
                  
                ],
             ) ,
             SizedBox(height: 100 ,) , 
             Container(
           
              height: 200 ,
               child: ListView.builder(
                scrollDirection: Axis.horizontal ,
                itemCount: controller.cartProductModel.length  , 
                itemBuilder: (Context , i ) {
                  return 
                  customProductWidjet(title: controller.cartProductModel[i].name!,
                   description: "hello", 
                   price: controller.cartProductModel[i].price!, 
                   image: controller.cartProductModel[i].image!  
                   ) ; 
                          
               }),
             )  ,
                  
              
                      
           Spacer(flex: 3,) , 
                  
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Container( 
               
                 alignment: Alignment.bottomRight ,
                 padding: EdgeInsets.symmetric(vertical: 15,  ),
                 child: MaterialButton(
                   minWidth: MediaQuery.of(context).size.width*0.35,  
                   padding: EdgeInsets.symmetric(vertical: 15  ),
                               
                   color: Colors.white ,
                   onPressed: () {
                     
                 } , 
                 child: 
                 
                 Text("Back" , style: TextStyle(fontSize: 18 , color: Colors.black),),
                 
                 ),
               ),
               Container( 
               
                 alignment: Alignment.bottomRight ,
                 padding: EdgeInsets.symmetric(vertical: 15,  ),
                 child: MaterialButton(
                   minWidth: MediaQuery.of(context).size.width*0.35,  
                   padding: EdgeInsets.symmetric(vertical: 15  ),
                               
                   color: Colors.green ,
                   onPressed: () {
                     
                 } , 
                 child: 
                 
                 Text("next" , style: TextStyle(fontSize: 18 , color: Colors.white),),
                 
                 ),
               ),
             ],
           )
           ] ,
           ),
         ) ,
      ),
     
   
    ) ;
  }
}
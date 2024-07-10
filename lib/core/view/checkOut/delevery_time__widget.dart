

import 'package:e_commerce_app/core/view/checkOut/summary_widget.dart';
import 'package:e_commerce_app/core/view/components/Delivery_choice_widget.dart';
import 'package:e_commerce_app/core/viewmodel/checkOut_View_Model.dart';
import 'package:e_commerce_app/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_stub/_file_decoder_stub.dart';

class DeleveryTime extends StatelessWidget {
   DeleveryTime({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15) , 
         child: Column(
         mainAxisAlignment: MainAxisAlignment.center ,
         children: [
           SizedBox(height: 50 ,) , 
           Row(
             children: [
               Icon(Icons.arrow_back_ios , ) , 
               SizedBox(width: MediaQuery.of(context).size.width*0.3,) , 
               Text("Checkout" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),) , 
                
              ],
           ) ,
           SizedBox(height: 100 ,) ,  
                
            
         DelivertChoice(title: "Standard Delivery", 
         subtitle: "order will be delivered between 3-5 buisness days" , 
         value: Delivery.standardDelivery ,
         ) , 
         DelivertChoice(title: "Next Day Delivery", 
         subtitle: "place you order before 6pm and your items will be delivred the next day" , 
         value: Delivery.NextDayDelivery ,
         ) , 
         DelivertChoice(title: "Nominated Delivery", 
         subtitle: "pick a particular date form calender and your order will be delivered on slected date"  , 
         value: Delivery.NominatedDelivery ,
         ) , 
                    
         Spacer(flex: 3,) , 
                
         Container( 
         
           alignment: Alignment.bottomRight ,
           padding: EdgeInsets.symmetric(vertical: 15,  ),
           child: MaterialButton(
             minWidth: MediaQuery.of(context).size.width*0.35,  
             padding: EdgeInsets.symmetric(vertical: 15  ),
                         
             color: Colors.green ,
             onPressed: () {
               Get.to(()=> summary()) ; 
           } , 
           child: 
           
           Text("next" , style: TextStyle(fontSize: 18 , color: Colors.white),),
           
           ),
         )
         ] ,
         ) ,
      ),
     
   
    ) ;
  }
}
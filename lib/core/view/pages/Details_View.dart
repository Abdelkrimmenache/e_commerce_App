

import 'package:e_commerce_app/core/model/Product_Model.dart';
import 'package:e_commerce_app/core/model/cart_Item_Model.dart';
import 'package:e_commerce_app/core/viewmodel/cart_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
     ProductModel? Model ; 
     

   DetailsView({super.key , this.Model } );

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center , 
            children: [
              Container(
                width: MediaQuery.of(context).size.width ,
                height: 240,
               decoration: BoxDecoration( 
                color: Colors.red ,
                image: DecorationImage(
                  image: NetworkImage("${Model!.image}")) , 
               ),
          
               
              ) , 
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10 ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text("${Model!.title}" , style: TextStyle(fontSize: 26 ) ,)
                      ),
          
          
                 SizedBox(height: 20 ,) , 
          
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20 ),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black ) , 
                          borderRadius: BorderRadius.circular(20 )
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20 ),
                        width: MediaQuery.of(context).size.width * .40 , 
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          children: [
                            Text("size") , 
                            Text("${Model!.sized}") , 
                          ],
                        ),
                      ) , 
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black ) , 
                          borderRadius: BorderRadius.circular(20 )
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20 ),
                         width: MediaQuery.of(context).size.width * .40 , 
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          children: [
                            Text("color") , 
                            Container(
                              width: 30 ,
                               height: 20,
                              decoration: BoxDecoration(
                                color: Model!.color,
                                border: Border.all(color: Colors.grey , ) , 
                                borderRadius: BorderRadius.circular(5) , 
                              ),
                            )
                          ],
                        ),
                      ) , 
                    
                      
                    ],
                   ),
                 ) ,
          
                  SizedBox(height: 20 ,) ,  
          
              Container(
                alignment: Alignment.topLeft, 
                child: Text("Details" , style: TextStyle(fontSize: 15 ) ,))  , 
               SizedBox(height: 20 ,) , 
              Container(
                alignment: Alignment.topLeft,
                child: Text("${Model!.description}" ,  style: TextStyle(fontSize: 15 , height: 2 ) ,)) 
          
                  ],
                ),
              ) ,
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20  , vertical: 10 ) , 
            
            //row of price and button 
            child: GetBuilder<CartViewModel>(
              init: CartViewModel() ,
              builder: (controller) => 
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text("Price"))),
                        Text("\$${Model!.price}" ,style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold , fontSize: 25 ), ),
                      ],
                    ),
                  ) , 
              
               
                     MaterialButton(
                      
                      height: 60 ,
                      minWidth: 150 ,
                      color: Colors.green ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10) , 
                      ),
                      onPressed: () {
                       controller.addProduct(CartProductModel(
                      name: Model!.title , 
                      price: Model!.price , 
                      image: Model!.image ,    
                      quantity: 1 , 
                      productId: Model!.productId
                     )) ; 
                    } , 
                    child: 
                    Text("Add" , style: TextStyle(color: Colors.white ),),
                    ) , 
                  
                  
                  
                  
                  
                ],
              ),
            ),
          )
        ],
      )
    ); 
  }
}
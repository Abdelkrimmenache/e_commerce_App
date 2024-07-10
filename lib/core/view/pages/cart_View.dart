

import 'package:e_commerce_app/core/view/checkOut/delevery_time__widget.dart';

import 'package:e_commerce_app/core/viewmodel/cart_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder: (controller) => 
              (controller.isCartEmpty() == true ) ? 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("Assets/images/Cart_Empty.svg" , height: 200 , width: 200 ,),
                  SizedBox(height: 20,) , 
                  Text("Cart Empty..." , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) 
                ] ,
              ) 
              : 
               Container(
                child: ListView.builder(
                   itemCount: controller.cartProductModel.length  , 
                   itemBuilder: (context , i ){
                    return 
                
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10  , vertical: 10 ) , 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height *0.16 ,
                            width: MediaQuery.of(context).size.width *0.35 ,
                          
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 205, 205),
                              image: DecorationImage(image: NetworkImage("${controller.cartProductModel[i].image}"))
                            ),
                          ) , 
                           
                          Container(
                            padding: EdgeInsets.only(left: 20 , top: 10 , bottom: 10 ) , 
                            height: MediaQuery.of(context).size.height *0.16, 
                            width: MediaQuery.of(context).size.width *0.55 ,
                            child: 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${controller.cartProductModel[i].name}" , style: TextStyle(fontSize: 25 )) , 
                                 SizedBox(height: 10 ,) , 
                                Text("\$${controller.cartProductModel[i].price}" , style: TextStyle(fontSize: 20  ,color: Colors.green )  ) , 
                                Spacer() , 
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: 90 ,
                                  height: 30 ,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 209, 209, 209) ,
                                    borderRadius: BorderRadius.circular(5 ) , 
                                  ),
                                  child: 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell (
                                        onTap: () {
                                          controller.decreaseQuantity(i) ;
                                        },
                                        child: Text("-" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),) ) ,
                                      SizedBox(width: 5 ,) ,  
                                      Text("${controller.cartProductModel[i].quantity}") , 
                                      SizedBox(width: 5 ,) ,  
                                      InkWell (
                                        onTap:  () {
                                          controller.increaseQuantity(i) ; 
                                        },
                                        child: Text("+" ,  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ))) , 
                            
                                    ],
                                  ),
                                ) 
                              ],
                            ),
                          ) , 
                        ],
                      ),
                    ) ; 
                
                
                   },
                ),
              ),
            ),
          ),

          GetBuilder<CartViewModel>(

            init: Get.find() ,
            builder: (controller) => 
              (controller.isCartEmpty() == true ) ? 
              Container() 
              :
              Container(
              margin: EdgeInsets.symmetric( horizontal: 10 , vertical: 10 ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      
                      child: Column(
                        children: [
                          Container(
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text("TOTALE"))),
                          Text("\$${controller.tatalPrice.toStringAsFixed(2)}" ,style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold , fontSize: 25 ), ),
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
                        Get.to(DeleveryTime()) ; 
                      } , 
                      child: 
                      Text("CHECKOUT" , style: TextStyle(color: Colors.white ),),
                      ),
                    
                  ],
                ),
            ),
          ),
        ],
      ),
    ) ; 
  }
}
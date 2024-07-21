
import 'package:e_commerce_app/adminApp/core/adminView/adminPages/addProductView.dart';
import 'package:e_commerce_app/adminApp/core/adminView/adminPages/editProductView.dart';
import 'package:e_commerce_app/adminApp/core/adminView/components/editCardProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

   String? username ; 
   HomeView({super.key,  this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 42, 61, 157),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 42, 61, 157),
        title: Center(child: Text("Home" , style: TextStyle(color: Colors.white , fontSize: 20),)),
      ),
      body: 
      Padding(
        padding: EdgeInsets.symmetric( horizontal: 20  ) , 
        child: SingleChildScrollView(
          child: 
          Column(
             children: [
              Row(
                children: [
                  Text("welcom " ,style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Colors.white), ) , 
                  Text("$username" ,style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold , color: Colors.white)) , 
                ],
              ) ,
              SizedBox(height: 20 ,) ,  
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => addProductView() ) ; 
                        },
                        child: EditProductCard(
                          title: "add product", 
                          icon: Icons.add_shopping_cart_outlined, 
                        ),
                      ) , 
                      GestureDetector(
                        onTap: () {
                          Get.to(() => EditProductView() ) ; 
                        },
                        child: EditProductCard(
                          title: "edit product", 
                          icon: Icons.mode_edit_outline, 
                        ),
                      ) , 
                    ],
                  ) , 
                  SizedBox(height: 20,) , 
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => addProductView() ) ; 
                        },
                        child: EditProductCard(
                          title: "delete product", 
                          icon: Icons.remove_shopping_cart_outlined, 
                        ),
                      ) , 
                      GestureDetector(
                        onTap: () {
                          Get.to(() => addProductView() ) ; 
                        },
                        child: EditProductCard(
                          title: "orders", 
                          icon: Icons.shopping_cart, 
                        ),
                      ) , 
                    ],
                  )

                 
                ],
              ) , 
              
        
        
             ],
          ),
        ),
      )
    ) ;
  }
}


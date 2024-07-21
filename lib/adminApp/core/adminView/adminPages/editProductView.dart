


import 'package:e_commerce_app/adminApp/core/adminView/adminPages/addProductView.dart';
import 'package:e_commerce_app/adminApp/core/adminView/adminPages/editProductInoView.dart';
import 'package:e_commerce_app/adminApp/core/adminViewModel/addProductViewModel.dart';
import 'package:e_commerce_app/core/view/components/custom_Product_widjet.dart';
import 'package:e_commerce_app/core/view/components/search_Bar.dart';
import 'package:e_commerce_app/core/view/pages/Details_View.dart';
import 'package:e_commerce_app/core/viewmodel/home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class EditProductView extends StatelessWidget {
  EditProductView({super.key});
  var controller = Get.find<HomeViewModel>() ;  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: controller , 
       builder: (controller) => 
       
       
        Scaffold(
        appBar: AppBar(
          title: Text("Edit product"),
        ),
             
        //the part of Button navigation Bar : 
        // bottomNavigationBar: bottomNavigationBar() , 
        
      
        ////////////////
        
        backgroundColor: Color.fromARGB(255, 255, 251, 251) ,
        body: 
        controller.loading.value == true ? Center(child: CircularProgressIndicator()) 
        :
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10 ) , 
          child: Column(
            children: [
             //categorie bloc :   
                Expanded(
                  child: GridView.builder(
                  
                               
                    itemCount: controller.productModel.length,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2 , 
                      crossAxisSpacing: 5, 
                      mainAxisSpacing: 10 , 
                      childAspectRatio: 1 , 
                       
                      ) , 
                    itemBuilder: (context , i ) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => editProductInfoView(
                          Model: controller.productModel[i]  ,
                          )) ; 
                      },
                      child: Container(
                  
                        
                        child:Stack(
                          alignment: Alignment.topRight,
                          children: [
                             customProductWidjet(
                          title: controller.productModel[i].title! ,
                          description: controller.productModel[i].description! ,
                          image: controller.productModel[i].image! ,
                          price: controller.productModel[i].price! ,
                        ),
                        GetBuilder<AddProductViewModel>(
                          init: Get.find<AddProductViewModel>(),
                          builder: (addcontroller) {
                            return GestureDetector(
                              onTap: () {
                               Get.defaultDialog(
                                title: 'Delete Product',
                                middleText: 'Are you sure you want to delete this product?',
                                textCancel: 'No',
                                textConfirm: 'Yes',
                                onConfirm: () {
                                  addcontroller.deleteProduct(controller.productModel[i]) ; 
                                  Get.offAll(() => EditProductView() ) ; 
                                },
                                onCancel: () {
                                  
                                }

                               ) ; 
                              },
                              child: Container(
                                
                                height: 20 ,
                                width: 20 ,
                                color: Colors.red ,
                                child: 
                                Center(child: Icon(Icons.close , color: Colors.white,)),
                              ),
                            );
                          }
                        ) 
                          ],
                        )
                        
                      ),
                    );
                  
                    }
                    
                    ),
                )
               
            ],
          ),
        )
      ),
    ) ;
  }
}
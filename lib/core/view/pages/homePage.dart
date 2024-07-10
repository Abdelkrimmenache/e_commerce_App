

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce_app/core/view/components/custom_Category_widjet.dart';
import 'package:e_commerce_app/core/view/components/custom_Product_widjet.dart';
import 'package:e_commerce_app/core/view/components/search_Bar.dart';
import 'package:e_commerce_app/core/view/pages/Details_View.dart';
import 'package:e_commerce_app/core/view/pages/cart_View.dart';
import 'package:e_commerce_app/core/view/pages/profile_View.dart';

import 'package:e_commerce_app/core/viewmodel/controller_home_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/home_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homePage extends StatelessWidget {

 

  
  TextEditingController mycontroller = TextEditingController() ;
  
  var controller = Get.find<HomeViewModel>() ;  

   homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: controller , 
       builder: (controller) => 
       controller.loading.value == true ? Center(child: CircularProgressIndicator()) 
       
       : Scaffold(
             
        //the part of Button navigation Bar : 
        // bottomNavigationBar: bottomNavigationBar() , 
        
      
        ////////////////
        
        backgroundColor: Color.fromARGB(255, 255, 251, 251) ,
        body: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10 ) , 
          child: Column(
            children: [
              SizedBox(height: 40 ,) ,  
              //serachBar 
              searchBar(controller: mycontroller) ,
              SizedBox(height: 40,)  , 
              Container(
      
                width: double.infinity ,
                child: Text("categoreis" ,style : TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),  ) 
                )  , 
      
            SizedBox(height: 50 ,) ,    
      
            //categorie bloc : 
            Container(
               
              height: 100 , 
              child: ListView.builder(
                scrollDirection: Axis.horizontal ,
                itemCount: controller.categoryModel.length ,
                itemBuilder: (context , i){
              
                  return 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10 ),
                    child: customCategorieWidjet(
                      imageName: controller.categoryModel[i].image! , 
                      categerieName: controller.categoryModel[i].name!   , 
                      Index: i,
                      ),
                  ) ;  
                    
                     
                  
                }
                
                ),
            ) , 
      
            SizedBox(height: 40,)  , 
              Container(
      
                width: double.infinity ,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    Text("Best Selling" ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ), ) ,   
                    Text("See all" ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ), ) ,   
      
                  ],
                )
                
                 
                )  ,
                SizedBox(height: 20 ,) , 
      
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
                        Get.to(() => DetailsView(Model: controller.productModel[i]  ,)) ; 
                      },
                      child: Container(
                  
                        
                        child: customProductWidjet(
                          title: controller.productModel[i].title! ,
                          description: controller.productModel[i].description! ,
                          image: controller.productModel[i].image! ,
                          price: controller.productModel[i].price! ,
                        ),
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

  // Widget bottomNavigationBar() {
  //   return
  //  GetBuilder<HomeViewModel>(
  //       init: HomeViewModel(), 
  //       builder: (controller) => 
  //          BottomNavigationBar(
  //         items: [
        
  //           BottomNavigationBarItem(
  //             activeIcon: Text("Explore" , style: TextStyle(fontWeight: FontWeight.w500),),
  //             icon: Icon(Icons.travel_explore) , 
  //             label: "" ,       
  //             ) , 
  //           BottomNavigationBarItem(
  //             activeIcon: Text("Cart" , style: TextStyle(fontWeight: FontWeight.w500),),
  //             icon: Icon(Icons.shopping_cart) , 
  //             label: ""  ,       
  //             ) , 
  //           BottomNavigationBarItem(
  //             activeIcon: Text("Account" , style: TextStyle(fontWeight: FontWeight.w500), ),
  //             icon: Icon(Icons.person)  , 
  //             label: "" ,       
  //             ) , 
        
  //         ] , 
  //         currentIndex: controller.navigatorValue  , 
  //         onTap: (Index) {
         
  //           controller.changeSelectedValue(Index) ; 

  //         },
  //         ),
  //     ) ; 



  // }
}





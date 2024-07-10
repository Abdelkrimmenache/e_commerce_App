

import 'package:e_commerce_app/core/model/User_Model.dart';
import 'package:e_commerce_app/core/view/components/Profile_Menu_View.dart';
import 'package:e_commerce_app/core/viewmodel/auth_View_Model.dart';
import 'package:e_commerce_app/core/viewmodel/profile_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  var controller = Get.find<profileViewModel>() ; 
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      builder: (controler) => 
       Scaffold(
        backgroundColor: Colors.white,
        body:  
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 ), 
            child: Column(
              children: [
                SizedBox(height: 40 ,) , 
                Row(
                  children: [
                    Container(
                      height: 130 ,
                      width: MediaQuery.of(context).size.width*0.33  ,
                      decoration: BoxDecoration(
                        color: Colors.black , 
                        borderRadius: BorderRadius.circular(100)     , 
                      image: DecorationImage(
                        image:  AssetImage("Assets/images/man.jpg" )  , fit: BoxFit.cover  
                        // image: controller.userMoldel == null ? 
                        //  AssetImage("Assets/images/man.jpg") :
                        //  controller.userMoldel.pic == "default" ? 
                        //  AssetImage("Assets/images/man.jpg") 
                        //  :NetworkImage(controller.userMoldel.pic) 
                      

                          )
                      ) , 
                      ) , 
            
                      SizedBox(width: 30 ,) , 
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.userMoldel.name! , style: TextStyle(fontSize: 20 ),), 
                        Text(controller.userMoldel.email!) , 
                      ],
                    ) , 

                     
                  ],
                ) , 
            
                SizedBox(height: MediaQuery.of(context).size.height* 0.15 ,) , 
                PofileMenuView(icon: Icons.edit_document , title: "Edit Profile", ) , 
                SizedBox(height: 30 ,) , 
                PofileMenuView(icon: Icons.maps_home_work_outlined , title: "Shipping adress", ) , 
                SizedBox(height: 30 ,) , 
                PofileMenuView(icon: Icons.watch_rounded, title: "Order history", ) , 
                SizedBox(height: 30 ,) , 
                PofileMenuView(icon: Icons.add_box , title: "Cards", ) , 
                SizedBox(height: 30 ,) ,    
                PofileMenuView(icon: Icons.add_box , title: "Notifications", ) , 
                SizedBox(height: 30 ,) , 
                PofileMenuView(icon: Icons.add_box , title: "Log out", ) , 
                SizedBox(height: 30 ,) , 
              ],
            ),
          ),
        )
      
      ),
    ) ; 
  }
}

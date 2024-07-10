

import 'package:e_commerce_app/core/view/components/custom_Button.dart';
import 'package:e_commerce_app/core/view/components/custom_text_Feild.dart';
import 'package:e_commerce_app/core/viewmodel/auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {

  GlobalKey<FormState> formstate = GlobalKey<FormState>() ; 
  
  
   SignUpScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 ) , 
        child: ListView(
          
          children: [
            IconButton(onPressed: (){
              Get.back() ; 
            }, 
            icon: Container(
              padding: EdgeInsets.symmetric(vertical: 30 ),
              alignment: Alignment.topLeft,
              child: Icon(Icons.arrow_back_ios_new_outlined ))  
            
            ) , 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15 ) , 
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) 
              ),
              child: Form(
                key: formstate ,
                child: Column(
                  
                  children: [
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween , 
                      children: [
                        Text("Sign Up , " , style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold ), ) , 
                       
                      ],
                    ) , 
                       
                      SizedBox(height: 40 ,) , 
        
        
                      Container(
                        width: double.infinity ,
                        child: Text("Name" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 163, 163, 163)), ) , ) ,  
                         SizedBox(height: 20 ,) , 
                         
                        textFeild( 
                          hinttext : "David Spad" , 
                          onSaved: (Value){
                           controller.name  = Value ; 
                          },
                          validator: (value) {
                            if(value == null ) {
                              print("Error") ; 
                            }
                          } ,  
                          
                          )  , 
        
                       SizedBox(height: 40 ,) ,     
                      Container(
                        width: double.infinity ,
                        child: Text("Email" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 163, 163, 163)), ) , ) ,  
                         SizedBox(height: 20 ,) , 
        
        
                         
                        textFeild( 
                          hinttext : "myemail@gmail.com" , 
                          onSaved: (Value){
                           controller.email = Value ; 
                          },
                          validator: (value) {
                            if(value == null ) {
                              print("Error") ; 
                            }
                          } ,  
                          
                          )  , 
                
                       SizedBox(height: 40 ,) , 
                       Container(
                        width: double.infinity ,
                        child: Text("Password" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 163, 163, 163)), ) , ) ,  
                     
                     
                         SizedBox(height: 20 ,) , 
                        textFeild(  
                          hinttext : "************" , 
                          onSaved: (Value){
                           controller.password = Value ;
                          },
                          validator: (value) {
                             if(value == null ) {
                              print("Error") ; 
                            }
                          } ,  
                          ) , 
                         SizedBox(height: 20 ,) ,   
                     
                         SizedBox(height: 20 ,) ,
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Colors.green ,
                          minWidth: double.infinity ,
                          onPressed: ()  {
                            formstate.currentState!.save() ; 
                            if(formstate.currentState!.validate()) {
                            controller.createUserWithEmailAndPassword() ; 
                            }
                        } , 
                        child: 
                        Text("sign Up" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 231, 191, 191)), ) , ) , 
                        
                
                
                  ],
                  
                ),
              ),
            ),
            SizedBox(height: 20 ,) , 
              
           
        
            SizedBox(height: 20 ,) , 
        
            
        
            
          ],
        ),
      )

    ) ; 
  }
}



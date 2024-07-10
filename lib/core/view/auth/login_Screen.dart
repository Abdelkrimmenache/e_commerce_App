

import 'package:e_commerce_app/core/view/auth/sign_Up_Screen.dart';
import 'package:e_commerce_app/core/view/components/custom_Button.dart';
import 'package:e_commerce_app/core/view/components/custom_text_Feild.dart';
import 'package:e_commerce_app/core/viewmodel/auth_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginScreen extends GetWidget<AuthViewModel> {

  GlobalKey<FormState> formstate = GlobalKey<FormState>() ; 
  
  
   loginScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20 ) , 
        child: ListView(
          
          children: [
            SizedBox(height: 50 ,)  , 
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
                        Text("Welcom , " , style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold ), ) , 
                        InkWell(
                          
                          onTap: () {
                            Get.to(() => SignUpScreen() )  ; 
                          },
                          child: Text("Sign UP" , style: TextStyle(color: Colors.green[300] , fontSize: 20),))
                      ],
                    ) , 
                      Container(
                      width: double.infinity,
                      child: Text("sign in to Continue" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 163, 163, 163)), ) , ) ,  
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
                        Container(
                          alignment: Alignment.centerRight,
                          width: double.infinity,
                          child: Text("Forget Password?")) ,
                         SizedBox(height: 20 ,) ,
                        MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Colors.green ,
                          minWidth: double.infinity ,
                          onPressed: ()  {
                            formstate.currentState!.save() ; 
                            if(formstate.currentState!.validate()) {
                            controller.signInWithEmailAndPassword() ; 
                            }
                        } , 
                        child: 
                        Text("sign in" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 231, 191, 191)), ) , ) , 
                        
                
                
                  ],
                  
                ),
              ),
            ),
            SizedBox(height: 20 ,) , 
            Text("-OR-") , 
            SizedBox(height: 20 ,) , 
            Container(
              padding: EdgeInsets.symmetric(vertical: 5 ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 66, 101, 129) , width: 0.5 ) , 
                borderRadius: BorderRadius.circular(5)

              ),
              child:
               customButton(
                title: "sign in with Facbook"  , 
                icon: Icons.facebook, 
                onPressed: () { }, 
                ),
            ) , 

            SizedBox(height: 20 ,) , 

            Container(
              padding: EdgeInsets.symmetric(vertical: 5 ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 66, 101, 129) , width: 0.5 ) , 
                borderRadius: BorderRadius.circular(5)

              ),
              child:
               customButton(
                title: "sign in with Google"  , 
                icon: Icons.chrome_reader_mode , 
                onPressed: () { 
                  //sign in with google 
                  controller.signInWithGoogle()  ; 




                },
                ),
            )

            
          ],
        ),
      )

    ) ; 
  }
}



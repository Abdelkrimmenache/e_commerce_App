

import 'package:e_commerce_app/adminApp/core/adminViewModel/adminAuth_ViewModel.dart';
import 'package:e_commerce_app/core/view/components/custom_text_Feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class adminLogin extends GetWidget<adminAuthViewModel> {
  GlobalKey<FormState> _formstate = GlobalKey<FormState>() ; 
   adminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: 

      Form(
        key: _formstate,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20  , vertical: 100 ) , 
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20 ),
              color: Colors.white , 
              
              child: Column(
                
                
                children: [
        
                
                  Container(
                    
                    width: double.infinity ,
                    
                    child: Text("Username" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 163, 163, 163)), ) , ),
              
                  SizedBox(height: 20 ,) , 
                  textFeild( 
                  hinttext : "Username" , 
                  onSaved: (Value){
                  controller.username = Value ; 
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
                  print("#######################################$Value") ; 
                  },
                  validator: (value) {
                    if(value == null ) {
                      print("Error") ; 
                    }
                  } ,  
                  ) , 
                SizedBox(height: 20 ,) , 
                  
                          MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.green ,
              minWidth: double.infinity ,
              onPressed: ()  {
                _formstate.currentState!.save() ; 
                controller.signInWithEmailAndPassword() ; 
                if(_formstate.currentState!.validate()) {
                }
                    } , 
                    child: 
                    Text("sign in" ,style: TextStyle(fontSize: 15 , color: Color.fromARGB(255, 231, 191, 191)), ) , ) , 
              
                ],
              ),
            ),
          ),
        ),
      ) ,  
        

    );
  }
}
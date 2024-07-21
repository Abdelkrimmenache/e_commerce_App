import 'package:e_commerce_app/adminApp/core/adminViewModel/addProductViewModel.dart';
import 'package:e_commerce_app/core/view/components/custom_Button.dart';
import 'package:e_commerce_app/core/view/components/custom_text_Feild.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addProductView extends StatelessWidget {

   GlobalKey<FormState> _formstate = GlobalKey<FormState>()  ; 
   addProductView({super.key});
  
  

  String category  = "cat1" ;
  List<DropdownMenuItem> categoryitems =  [
  DropdownMenuItem(
    value: "cat1",
    child:Text("Gadget")
  
    ) , 
  DropdownMenuItem(
    value: "cat2",
    child:Text("Man")
  
    ) , 
  DropdownMenuItem(
    value: "cat3",
    child:Text("wemon")
  
    ) , 
  DropdownMenuItem(
    value: "cat4",
    child:Text("games")
  
    ) , 
  
] ;

  List<DropdownMenuItem> sizeitems = [
    DropdownMenuItem(
      value: "L",
      child:Text("L")
    
      ) , 
    DropdownMenuItem(
      value: "M",
      child:Text("M")
    
      ) , 
    DropdownMenuItem(
      value: "XL",
      child:Text("XL")
    
      ) , 
    DropdownMenuItem(
      value: "XXL",
      child:Text("XXL")
    
      ) , 
    DropdownMenuItem(
      value: "XXXL",
      child:Text("XXXL")
    
      ) , 
  ] ; 





  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<AddProductViewModel>(
      init: Get.find<AddProductViewModel>() , 
      builder: (controller) {
        return Scaffold(
        appBar:  AppBar(
         title: Center(child: Text("add product" , style: TextStyle(fontWeight: FontWeight.bold),),),  
        ) , 
        body: 
        Padding(
        
          padding: EdgeInsets.symmetric(horizontal: 20 ) , 
          child: SingleChildScrollView(
            child: 
            Form(
              key: _formstate,
              child: Column(
                children: [
                  SizedBox(height: 30,) , 
                  Text("upload the product pucture" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),) , 
                  SizedBox(height: 20,) , 
                  (controller.selctedImage != null ) ? 
                  GestureDetector(
                    onTap: () {
                      controller.getImage() ; 
                    },
                    child: Container(
                    height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black , width: 3 ) , 
                        image: DecorationImage(image:FileImage(controller.selctedImage!) )
                       
                      ),
                     
                    ),
                  )  
                  
                  : GestureDetector(
                    onTap: () {
                      controller.getImage() ; 
                    },
                    child: Container(
                      height: 140 ,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black , width: 3 ) , 
                       
                      ),
                      child: Center(
                        child: 
                        Icon(Icons.photo_camera_back),
                      ), 
                    ),
                  ) , 
                  SizedBox(height: 30 ,) , 
              
                      ///////////////////////
                     Container(
                          
                      width: double.infinity ,
                      
                      child: Text("name" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),  ) ),
                
                    SizedBox(height: 10 ,) , 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2 , color: Colors.black)
                      ),
                      child: textFeild( 
                      hinttext : "product name" , 
                      onSaved: (Value){
                      controller.name = Value ; 
                      print("${controller.name}") ;
                      },
                      validator: (value) {
                        if(value == "" ) {

                          return "enter a value please" ; 

                        }
                      } ,  
                      
                      ),
                    )  ,
                    SizedBox(height: 20,) ,  
                      
                  //name  : 
                     Container(
                          
                      width: double.infinity ,
                      
                      child: Text("description" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),  ) ),
                
                    SizedBox(height: 10 ,) , 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2 , color: Colors.black)
                      ),
                      child: textFeild( 
                      maxLines: 7 ,
                      hinttext : "add a description for you product" , 
                      onSaved: (Value){
                      controller.description = Value ; 
                      },
                      validator: (value) {
                        if(value == "") {
                          return "enter a value please" ; 
                        }
                      } ,  
                      
                      ),
                    )  ,
                    SizedBox(height: 20,) ,  
                      
                  //name  : 
                     Container(
                          
                      width: double.infinity ,
                      
                      child: Text("size" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),  ) ),
                
                    SizedBox(height: 10 ,) , 
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2 , color: Colors.black)
                      ),
                      child: DropdownButton(
                      
                        value: controller.size ,
                        onChanged:(newvalue) {
                          controller.onsaved(newvalue!) ; 
                          print("${controller.size}") ; 
                        },
                        items: sizeitems 
                       
                        ) , 
                    )  ,
                    SizedBox(height: 20,) ,  
              
                     Container(
                          
                      width: double.infinity ,
                      
                      child: Text("color" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),  ) ),
                
                    SizedBox(height: 10 ,) , 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2 , color: Colors.black)
                      ),
                      child: textFeild( 
                      hinttext : "add hex color ex : Ffd500 " , 
                      onSaved: (Value){
                      controller.color = Value! ; 
                      },
                      validator: (value) {
                        if(value == null ) {
                          return "fill the feild" ; 
                        }
                      } ,  
                      
                      ),
                    )  ,
                    SizedBox(height: 20,) , 
                      
               
                     Container(
                          
                      width: double.infinity ,
                      
                      child: Text("category" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),  ) ),
                
                    SizedBox(height: 10 ,) , 
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2 , color: Colors.black)
                      ),
                      child: DropdownButton(
                        
                        value: category  ,
                        onChanged:(newvalue) {
                          category = newvalue! ; 
                        },
                        items: categoryitems 
                       
                        ) , 
                    )  ,
                    SizedBox(height: 20,) ,  
                     //name  : 
                     Container(
                          
                      width: double.infinity ,
                      
                      child: Text("price" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ),  ) ),
                
                    SizedBox(height: 10 ,) , 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20 ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2 , color: Colors.black)
                      ),
                      child: textFeild( 
                      hinttext : "product price" , 
                      onSaved: (Value){
                      controller.price = double.tryParse(Value!) ?? 0.0 ; 
                      },
                      validator: (value) {
                        if(value == "" ) {
                          return "enter a value please" ;  
                        }
                      } ,  
                      
                      ),
                    )  ,
                    SizedBox(height: 20,) , 
                   
                   MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    color: Colors.blue,
                    minWidth: double.infinity,
                    onPressed: () {
                  _formstate.currentState!.save() ; 
                  if(_formstate.currentState!.validate()) {
                    controller.saveProduct() ; 
                  }

                   } , 
                   child: (controller.isLoading == true) ? 
                   Center(child: CircularProgressIndicator()) :
                   Text("add product" ,style: TextStyle(color: Colors.white , ),),
                   
                   )
                    
                  
                        
                ],
              ),
            ),
          ),
        )
        );
      }
    );
  }
}
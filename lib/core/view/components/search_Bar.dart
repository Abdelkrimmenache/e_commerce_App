
import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      decoration:
       InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 3 ) ,
        prefixIcon:  Icon(Icons.search , ),
        suffixIcon: IconButton(
         onPressed: (){
          controller.clear() ; 
         },
         icon:  Icon(Icons.close ),
         
         ) , 
       
        filled: true , 
        fillColor: Color.fromARGB(255, 238, 238, 238) ,  
        border: OutlineInputBorder(
          
          borderSide: BorderSide.none ,
          borderRadius: BorderRadius.circular(10) , 
        ) , 
            
      ),
    
      
            
    );
  }
}
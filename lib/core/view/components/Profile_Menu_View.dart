



import 'package:flutter/material.dart';

class PofileMenuView extends StatelessWidget {
  String title ; 
  IconData icon ; 

   PofileMenuView({
    super.key, required this.icon , required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        Row(
          
          children: [
            Container(
              height: 40 ,
              width:  40  ,
              color: Color.fromARGB(255, 238, 238, 238)  ,
              child: 
              Icon(icon) ,
              
            ),
        
        SizedBox(width: 20 ,) , 
        Text("$title" ,style: TextStyle(fontSize: 18),) , 
        ],
        ) ,
              
        Icon(Icons.arrow_forward_ios_outlined) ,  
         
      ],
    );
  }
}
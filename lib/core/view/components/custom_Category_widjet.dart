import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class customCategorieWidjet extends StatelessWidget {
  const customCategorieWidjet({
    super.key,
    required this.imageName,
    required this.categerieName, required this.Index,
  });

  final String imageName;
  final String categerieName;
  final int Index ; 

  @override
  Widget build(BuildContext context) {
    return Container( 
      
      margin: EdgeInsets.all(10),
      child: 
      Column(
        children: [
          Container(
            
            height: 50 ,
            width: 50 ,
            decoration: BoxDecoration(
              
              color: Colors.white ,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(imageName ,scale: 0.1 ) ,
                fit: BoxFit.cover ,  
                ) 
          
            ),
            
            ) , 
          SizedBox(height: 10 ,) ,   
          Text("${categerieName}" , style : TextStyle(fontSize: 12 , fontWeight: FontWeight.bold ),) , 
          
        ],
      )
    );
  }
}
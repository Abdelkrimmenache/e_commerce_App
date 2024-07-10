import 'package:flutter/material.dart';

class customProductWidjet extends StatelessWidget {
 
 final String image , title , description ; 
 final double price ;

  const customProductWidjet({
    super.key, required this.title , required this.description ,required this.price ,required this.image 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container ( 
             height: 120,
             width: MediaQuery.of(context).size.width* 0.4,
             
              decoration: BoxDecoration(
                              
              color: Color.fromARGB(255, 238, 238, 238) ,
              
              image: DecorationImage(
                image: NetworkImage("${image}" , ) ,
                fit: BoxFit.contain ,  
                ) 
            
              ),
              
              ) , 
            SizedBox(height: 10 ,) ,   
            Container(
              alignment: Alignment.centerLeft,
              child: Text( title , style : TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),)) ,  
           
           
            Container(
              alignment: Alignment.bottomLeft, 
              child: Text("\$${price}" , style : TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ,color: Colors.green ),)) 
        
      ],
                ),
    );
  }
}

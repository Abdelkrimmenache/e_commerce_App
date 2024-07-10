
import 'package:flutter/material.dart'; 

class customButton extends StatelessWidget {
  final  IconData? icon ; 
  final String title ; 
  final void Function()? onPressed   ; 
  
  const customButton({
    required this.title , 
    required this.icon , 
    required this.onPressed , 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      
      onPressed: onPressed , 
      child: 
      Row(
        
        children: [
          Icon(icon) , 
          SizedBox(width: 50 ,) , 
          Text("$title"),
        ],
      ), 
      );
  }
}

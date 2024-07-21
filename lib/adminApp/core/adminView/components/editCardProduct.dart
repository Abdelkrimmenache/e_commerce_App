


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProductCard extends StatelessWidget {
  final IconData? icon ; 
  final String title ; 
  const EditProductCard({
    super.key, required this.title , required this.icon 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180 ,
      width: Get.mediaQuery.size.width * 0.40 ,
      decoration: BoxDecoration(
        color: Color.fromARGB(143, 114, 81, 250)  , 
        borderRadius: BorderRadius.circular(20)
      ),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon , color: Colors.white , size: 70,) , 
          Text(title , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),  ) , 
        ],
      ),
    );
  }
}
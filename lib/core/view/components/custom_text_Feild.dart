// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class textFeild extends StatelessWidget {
  final String hinttext ; 
  void Function(String?)? onSaved ; 
  String? Function(String?)? validator ; 
   textFeild({
    Key? key,
    required this.hinttext, 
    required this.onSaved , 
    required this.validator , 

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved ,
      validator:  validator ,
      decoration: InputDecoration(
        hintText: "$hinttext" , 
        contentPadding: EdgeInsets.symmetric(vertical: 2)
      ),
    );
  }
}

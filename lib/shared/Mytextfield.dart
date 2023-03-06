import 'package:flutter/material.dart';
class Mytextfield extends StatelessWidget {


  final TextInputType textInputTypee;

  final bool ispassword;

  final String textinbox;

  Mytextfield({required this.textInputTypee,required this.ispassword,required this.textinbox});

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: textInputTypee,
        obscureText: ispassword,
        decoration: InputDecoration(
          hintText: textinbox,
          // To delete borders
          enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
          // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,),),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}

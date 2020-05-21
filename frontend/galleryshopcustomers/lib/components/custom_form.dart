import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final Widget icon;
  final TextInputType textInputType;

  CustomForm(
      {this.controller, this.label, this.tip, this.icon, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Color(0xFFF234253), fontWeight: FontWeight.bold),
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0)),
        labelStyle: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        labelText: label,
        hintText: tip,
        suffixIcon: icon,
      ),

      keyboardType: textInputType,

    );

  }
}

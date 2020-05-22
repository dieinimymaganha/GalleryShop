import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final Widget icon;
  final TextInputType textInputType;
  final bool obscure;
  final bool mandatory;

  CustomForm({
    this.controller,
    this.label,
    this.tip,
    this.icon,
    this.textInputType,
    this.obscure,
    this.mandatory,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style:
            TextStyle(color: Color(0xFFF234253), fontWeight: FontWeight.bold),
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: icon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          labelText: label,
          hintText: tip,
        ),
        keyboardType: textInputType,
        validator: (value) {
          if (mandatory == true) {
            if (value.isEmpty) {
              return 'Campo obrigatório';
            }
            return null;
          }
          return null;
        });
  }
}

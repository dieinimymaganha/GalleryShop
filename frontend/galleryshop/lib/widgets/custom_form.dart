import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final Widget icon;
  final TextInputType textInputType;
  final bool obscure;
  final bool mandatory;
  final Function(String) onChanged;
  final bool enabled;
  final Widget suffix;
  final int maxlength_field;
  final Function ontap;

  CustomForm(
      {this.controller,
      this.label,
      this.tip,
      this.icon,
      this.textInputType,
      this.obscure,
      this.mandatory,
      this.onChanged,
      this.enabled,
      this.suffix,
      this.maxlength_field,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxlength_field),
        ],
        style:
            TextStyle(color: Color(0xFFF234253), fontWeight: FontWeight.bold),
        controller: controller,
        obscureText: obscure,
        onChanged: onChanged,
        enabled: enabled,
        onTap: ontap,
        decoration: InputDecoration(
          prefixIcon: icon,
          suffix: suffix,
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

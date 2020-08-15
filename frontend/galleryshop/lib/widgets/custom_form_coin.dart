import 'package:brasil_fields/formatter/real_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormCoin extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final Widget icon;
  final TextInputType textInputType;
  final bool mandatory;
  final Function(String) onChanged;
  final bool enabled;
  final Widget suffix;
  final int maxlengthField;

  CustomFormCoin({
    this.controller,
    this.label,
    this.tip,
    this.icon,
    this.textInputType,
    this.mandatory,
    this.onChanged,
    this.enabled,
    this.suffix,
    this.maxlengthField,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxlengthField),
          WhitelistingTextInputFormatter.digitsOnly,
          RealInputFormatter(centavos: true),
        ],
        style:
            TextStyle(color: Color(0xFFF234253), fontWeight: FontWeight.bold),
        controller: controller,
        onChanged: onChanged,
        enabled: enabled,
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

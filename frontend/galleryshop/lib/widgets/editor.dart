import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String tip;
  final IconData icon;
  final TextInputType textInputType;

  Editor({
    this.controller,
    this.label,
    this.tip,
    this.icon,
    this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: tip,
        ),
        keyboardType: textInputType,
      ),
    );
  }
}

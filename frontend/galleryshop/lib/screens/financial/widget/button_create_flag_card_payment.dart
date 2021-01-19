import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';

class ButtonCreateFlagCardPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.credit_card
      ),
      onPressed: (){},
      backgroundColor: colorAppbar,
    );
  }
}

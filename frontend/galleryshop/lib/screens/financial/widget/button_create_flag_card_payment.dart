import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/financial/create_new_flag_card_payment_screen.dart';

class ButtonCreateFlagCardPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.credit_card),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNewFlagCardPaymentScreen()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

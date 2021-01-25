import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/bar_shop/create_new_product_screen.dart';

class ButtonCreateNewProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateNewProductScreen()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

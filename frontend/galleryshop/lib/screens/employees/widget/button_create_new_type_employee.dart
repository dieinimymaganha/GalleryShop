import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/client/create_new_user_client_screen.dart';

class ButtonCreateNewTypeEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,

      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewUserClientScreen()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/client/create_new_user_client.dart';

class ButtonCreateClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.person_add,

      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewUserClient()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

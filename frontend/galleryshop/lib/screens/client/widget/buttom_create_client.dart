import 'package:flutter/material.dart';
import 'package:galleryshop/screens/client/create_new_user_client.dart';

class ButtomCreateClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.person_add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewUserClient()));
      },
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
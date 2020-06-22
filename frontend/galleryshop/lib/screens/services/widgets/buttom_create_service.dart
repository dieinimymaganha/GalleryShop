import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/client/create_new_user_client.dart';
import 'package:galleryshop/screens/services/create_new_service.dart';

class ButtomCreateService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewService()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

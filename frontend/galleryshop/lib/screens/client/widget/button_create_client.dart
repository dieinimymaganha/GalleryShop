import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/client/create_new_user_client_screen.dart';
import 'package:galleryshop/screens/employees/create_new_employee_screen.dart';

class ButtonCreateClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.person_add,

      ),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreateNewEmployeeScreen()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

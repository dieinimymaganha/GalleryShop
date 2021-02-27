import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/employees/create_new_employee_screen.dart';

class ButtonCreateNewEmployee extends StatelessWidget {
  final bool editMyAccount;


  ButtonCreateNewEmployee({this.editMyAccount});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.person_add,
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateNewEmployeeScreen(
              editMyAccount: editMyAccount,
            )));
      },
      backgroundColor: colorAppbar,
    );
  }
}

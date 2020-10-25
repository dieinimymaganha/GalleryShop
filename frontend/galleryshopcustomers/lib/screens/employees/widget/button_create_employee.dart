import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';

import '../create_new_employee_screen.dart';

class ButtonCreateNewEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.person_add,
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateNewEmployeeScreen()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';

import '../edit_type_employee.dart';

class ButtonCreateNewTypeEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        showDialog(
            context: context, builder: (context) => EditTypeEmployeeDialog());
      },
      backgroundColor: colorAppbar,
    );
  }
}

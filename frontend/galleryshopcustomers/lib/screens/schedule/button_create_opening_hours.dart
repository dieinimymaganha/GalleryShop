import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';

import 'create_new_opening_hours.dart';


class ButtonCreateNewOpeningHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.alarm_add,
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateNewOpeningHours()));
      },
      backgroundColor: colorAppbar,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';

import '../create_new_service_screen.dart';


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
            .push(MaterialPageRoute(builder: (context) => CreateNewServiceScreen()));
      },
      backgroundColor: colorAppbar,
    );
  }
}

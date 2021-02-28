import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/widgets/drawer/IconSection.dart';
import 'package:galleryshopcustomers/widgets/drawer/custom_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            CustomHeard(),
            IconSection(),
            Container(
              height: 470,
              decoration: BoxDecoration(color: Colors.blueGrey[100]),
            )
          ],
        ),
      ),
    );
  }
}

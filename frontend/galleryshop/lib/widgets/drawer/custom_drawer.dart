import 'package:flutter/material.dart';
import 'package:galleryshop/widgets/drawer/IconSection.dart';
import 'package:galleryshop/widgets/drawer/custom_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          CustomHeard(),
          IconSection(),
          Container(
            height: 150,
            decoration: BoxDecoration(color: Colors.blueGrey[100]),
          )
        ],
      ),
    );
  }
}

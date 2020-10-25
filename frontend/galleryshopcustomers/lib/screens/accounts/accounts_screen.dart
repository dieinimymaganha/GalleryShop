import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/widgets/drawer/custom_drawer.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas'),
        backgroundColor: colorAppbar,
        centerTitle: true,
      ),
      body: Container(),
      drawer: CustomDrawer(),
    );
  }
}

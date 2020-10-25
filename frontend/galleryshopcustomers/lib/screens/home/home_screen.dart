import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/data/values.dart';
import 'package:galleryshopcustomers/widgets/drawer/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        backgroundColor: colorAppbar,
      ),
      backgroundColor: Colors.white10,
      body: Container(
        color: Colors.white,
      ),
      drawer: CustomDrawer(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';
import 'package:galleryshop/widgets/option_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl =
      'https://avatars1.githubusercontent.com/u/38332691?s=460&v=4';

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

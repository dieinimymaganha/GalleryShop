import 'package:flutter/material.dart';
import 'package:galleryshop/data/values.dart';
import 'package:galleryshop/screens/bar_shop/bar_shop_list_screen.dart';
import 'package:galleryshop/screens/bar_shop/create_new_product_screen.dart';
import 'package:galleryshop/widgets/drawer/custom_drawer.dart';

class BarShopBaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar'),
        backgroundColor: colorAppbar,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 2, left: 8, right: 8),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: ListTile(
                  title: Text('Listar produtos'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BarShopListScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              GestureDetector(
                child: ListTile(
                  title: Text('Cadastrar produto'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateNewProductScreen()));
                },
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}

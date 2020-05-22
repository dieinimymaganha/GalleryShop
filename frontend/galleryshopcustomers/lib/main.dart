import 'package:flutter/material.dart';
import 'package:galleryshopcustomers/screens/login.dart';
void main() {
  runApp(GalleryShopCustomers());
}

class GalleryShopCustomers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery Shop Customers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
//      home: FormCreateNewClient(),
      home: LoginPage(),
    );
  }
}

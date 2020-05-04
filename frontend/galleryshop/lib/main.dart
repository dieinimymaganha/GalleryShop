import 'package:flutter/material.dart';
import 'package:galleryshop/screens/FormCreateNewClient.dart';

void main() {
  runApp(GalleryShop());
}

class GalleryShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: FormCreateNewClient(),
    );
  }
}


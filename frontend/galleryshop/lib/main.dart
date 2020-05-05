import 'package:flutter/material.dart';
import 'package:galleryshop/screens/form_create_new_client.dart';

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
          buttonColor: Colors.blueAccent[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: FormCreateNewClient(),
    );
  }
}


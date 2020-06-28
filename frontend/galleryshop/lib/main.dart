import 'package:flutter/material.dart';
import 'package:galleryshop/blocs/drawer_bloc.dart';
import 'package:galleryshop/screens/base/base_screen.dart';
import 'package:galleryshop/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GalleryShop());
}

class GalleryShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[900],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
//      home: FormCreateNewClient(),
        debugShowCheckedModeBanner: false,
        home: BaseScreen(),
      ),
    );
  }
}
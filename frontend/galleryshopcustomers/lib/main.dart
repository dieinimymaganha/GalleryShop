import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:galleryshopcustomers/blocs/drawer_bloc.dart';
import 'package:galleryshopcustomers/screens/base/base_screen.dart';
import 'package:galleryshopcustomers/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(GalleryShopCustomers());
}

class GalleryShopCustomers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DrawerBloc>(
          create: (_) => DrawerBloc(),
          dispose: (context, value) => value.dispose(),
        ),
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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [const Locale('pt', 'BR')],
//      home: FormCreateNewClient(),
        debugShowCheckedModeBanner: false,
        home: BaseScreen(),
      ),
    );
  }
}

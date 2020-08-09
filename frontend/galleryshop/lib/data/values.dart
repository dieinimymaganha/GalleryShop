import 'package:flutter/material.dart';


String appName = "Famguard";

Color colorGradientTop = Color(0XFF212121);
Color colorGradientBottom = Color(0XFF616161);
Color colorAppbar = Color.fromRGBO(41, 52, 56, 1);

Gradient appGradient =
    LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
    colors: [colorGradientTop, colorGradientBottom,], stops: [0,0.7]);

const double space = 10.0;

const background = "images/grey-gradient-background.jpg";


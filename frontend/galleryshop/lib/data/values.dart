import 'package:flutter/material.dart';


String appName = "Famguard";

Color colorGradientTop = Color(0XFF212121);
Color colorGradientBottom = Color(0XFF616161);
Color colorAppbar = Color(0XFF9E9E9E);

Gradient appGradient =
    LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
    colors: [colorGradientTop, colorGradientBottom,], stops: [0,0.7]);
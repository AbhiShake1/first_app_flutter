import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Themes {
  static ThemeData light(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.yellow,
      backgroundColor: Vx.blueGray300,
      scaffoldBackgroundColor: Vx.blueGray300,
      cardColor: Vx.blueGray100,
      primaryColor: Vx.coolGray700,
      canvasColor: Vx.coolGray500,
      accentColor: Vx.yellow400,
      focusColor: Colors.black,
      hintColor: Vx.coolGray700,
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.orange,
      backgroundColor: Vx.blueGray800,
      scaffoldBackgroundColor: Vx.blueGray800,
      cardColor: Vx.blueGray600,
      primaryColor: Vx.coolGray300,
      canvasColor: Vx.coolGray400,
      accentColor: Vx.orange500,
      focusColor: Colors.white,
      hintColor: Vx.coolGray300,
    );
  }
}

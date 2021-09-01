import 'package:first_app_flutter/page/CartPage.dart';
import 'package:first_app_flutter/util/Themes.dart';
import 'package:flutter/material.dart';

import 'page/HomePage.dart';
import 'page/LoginPage.dart';
import 'util/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: Themes.dark(context),
      theme: Themes.light(context),
      routes: {
        '/' : (c) => HomePage(), //by default or if no path found
        Routes.home : (c) => HomePage(),
        Routes.login : (c) => LoginPage(),
        Routes.cart : (c) => CartPage(),
      },
    );
  }
}

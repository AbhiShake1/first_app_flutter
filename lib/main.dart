import 'package:flutter/material.dart';

import 'page/HomePage.dart';
import 'page/LoginPage.dart';
import 'util/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (c) => HomePage(), //by default or if no path found
        Routes.home : (c) => HomePage(),
        Routes.login : (c) => LoginPage(),
      },
    );
  }
}

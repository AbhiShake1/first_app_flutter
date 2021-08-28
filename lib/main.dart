import 'package:flutter/material.dart';

import 'page/HomePage.dart';
import 'page/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (c) => LoginPage(), //by default or if no path found
        '/home' : (c) => HomePage(),
        '/login' : (c) => LoginPage(),
      },
    );
  }
}

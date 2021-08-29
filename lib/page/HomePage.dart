import 'package:flutter/material.dart';

import '../widget/Drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system, // auto dark mode
      // configs to apply when dark mode
      // theme: named arg for light theme config
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellowAccent,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Learning flutter"),
        ),
        drawer: HomeDrawer(),
        body: Center(
          child: Text("This is body"),
        ),
      ),
    );
  }
}

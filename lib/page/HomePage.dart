import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system, // auto dark mode
      // configs to apply when dark mode
      // theme: named arg for light theme config
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrangeAccent,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is app bar"),
        ),
        drawer: Drawer(
          child: Center(
            child: Text("Drawer"),
          ),
        ),
        body: Center(
          child: Text("This is body"),
        ),
      ),
    );
  }
}

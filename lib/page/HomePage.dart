import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

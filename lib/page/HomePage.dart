import 'dart:convert';

import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:first_app_flutter/widget/ItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        body: _HomeBody(),
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  //final dummyList = List.generate(20, (index) => CatalogModel.items[0]);

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  @override
  Widget build(BuildContext context) {
    return (CatalogModel.items?.isNotEmpty ?? false)
        ? ListView.builder(
            //itemCount: dummyList.length,
            itemCount: CatalogModel.items?.length,
            itemBuilder: (c, i) => Padding(
                padding: const EdgeInsets.all(6.0),
                child: ItemWidget(
                  //item: dummyList[i],
                  item: CatalogModel.items![i],
                )),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    final catalogJson =
            await rootBundle.loadString("assets/files/catalog.json"),
        decodedJson = jsonDecode(catalogJson),
        productsData = decodedJson["products"];

    setState(() {
      CatalogModel.items =
          List.from(productsData).map<Item>((i) => Item.fromMap(i)).toList();
    });
  }
}

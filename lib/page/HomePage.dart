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
  //final dummyList = List.generate(20, (_) => CatalogModel.items![0]);

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  @override
  Widget build(BuildContext context) {
    return (CatalogModel.items?.isNotEmpty ?? false)
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
            ),
            itemCount: CatalogModel.items!.length,
            itemBuilder: (_, i) {
              final item = CatalogModel.items![i];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: GridTile(
                  child: Image.network(item.imageUrl),
                  header: Container(
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                  ),
                  footer: Container(
                    child: Text(
                      item.price.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor
                          ?.withGreen(90),
                    ),
                  ),
                ),
              );
            },
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

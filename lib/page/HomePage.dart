import 'dart:convert';

import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _CatalogHeader(),
            _HomeBody(),
          ],
        ).p32().backgroundColor(Vx.blueGray300),
      ),
    );
  }
}

class _CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "DragonOwl Tech Nepal"
            .text
            .xl5
            .extraBold
            .underline
            .orange500
            .makeCentered()
            .py32(),
        VxBox().py64.make(),
        "Trending Products".text.xl3.bold.orange400.italic.make().p(18),
      ],
    );
  }
}

class _CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (c, i) {
        final catalog = CatalogModel.items![i];
        return _CatalogItem(
          catalog: catalog,
        );
      },
    );
  }
}

class _CatalogItem extends StatelessWidget {
  final Item catalog;

  const _CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          _CatalogImage(
            imageUrl: catalog.imageUrl,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl2.coolGray700.make(),
                catalog.desc.text.textStyle(context.captionStyle!).xl.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.orange500.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Buy".text.make().animatedBox.rounded.make(),
                      style: ElevatedButton.styleFrom(
                        primary: Vx.orange500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(110).make().py(16);
  }
}

class _CatalogImage extends StatelessWidget {
  final imageUrl;

  const _CatalogImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
    ).box.roundedSM.color(Vx.blueGray300).p8.make().p16().wh24(context);
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
        ? _CatalogList().expand()
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

import 'dart:convert';

import 'package:first_app_flutter/model/CartModel.dart';
import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:first_app_flutter/page/HomeDetailPage.dart';
import 'package:first_app_flutter/util/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widget/GlobalCircularProgressIndicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.navigator?.pushNamed(
          Routes.cart,
        ),
        child: Icon(CupertinoIcons.shopping_cart),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _CatalogHeader(),
            _HomeBody(),
          ],
        ).p32().backgroundColor(context.backgroundColor),
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
            .color(context.accentColor)
            .makeCentered()
            .py32(),
        VxBox().py64.make(),
        "Trending Products"
            .text
            .xl3
            .bold
            .color(context.accentColor.withRed(-10))
            .italic
            .make()
            .p(18),
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
        return InkWell(
          child: _CatalogItem(
            catalog: catalog,
          ),
          onTap: () => context.navigator?.push(
            MaterialPageRoute(
              builder: (c) => HomeDetailPage(catalog: catalog),
            ),
          ),
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
          Hero(
            tag: Key(catalog.id),
            child: _CatalogImage(
              imageUrl: catalog.imageUrl,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl2.color(context.primaryColor).make(),
                catalog.desc.text
                    .color(context.canvasColor)
                    .textStyle(context.captionStyle!)
                    .xl
                    .make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .color(context.accentColor)
                        .bold
                        .xl
                        .make(),
                    _AddToCart(catalog),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(110).make().py(16);
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;

  const _AddToCart(this.catalog);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(
          () {
            isAdded = isAdded.toggle();
            final cart = CartModel();
            cart.catalog = CatalogModel();
            cart.add(widget.catalog);
          },
        );
      },
      child: isAdded
          ? Icon(Icons.done)
          : "Add to cart".text.make().animatedBox.rounded.make(),
      style: ElevatedButton.styleFrom(
        primary: context.accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class _CatalogImage extends StatelessWidget {
  final imageUrl;

  const _CatalogImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      errorBuilder: (c, e, s) => GlobalCircularProgressIndicator(),
    )
        .box
        .roundedSM
        .color(context.backgroundColor)
        .p8
        .make()
        .p16()
        .wh24(context);
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
        : GlobalCircularProgressIndicator().py(context.screenHeight / 4);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(
      Duration(
        seconds: 2,
      ),
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

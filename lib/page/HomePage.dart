import 'dart:convert';

import 'package:first_app_flutter/core/Store.dart';
import 'package:first_app_flutter/model/CartModel.dart';
import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:first_app_flutter/util/Routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../widget/GlobalCircularProgressIndicator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as Store).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {
          AddMutation,
        },
        builder: (c, s, s_) {
          return FloatingActionButton(
            onPressed: () => context.vxNav.push(
              Uri.parse(Routes.cart),
            ),
            child: Icon(CupertinoIcons.shopping_cart),
          ).badge(
            color: c.theme.focusColor,
            size: 20,
            count: cart.items.length,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          );
        },
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
            .shimmer(
              primaryColor: context.accentColor,
              secondaryColor: context.theme.backgroundColor,
            )
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
    return RefreshIndicator(
      onRefresh: () async {
        void rebuild(Element e) {
          e.markNeedsBuild();
          e.visitChildren(rebuild);
        }

        (context as Element).visitChildren(rebuild);
      },
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items!.length,
        itemBuilder: (c, i) {
          final catalog = CatalogModel.items![i];
          return InkWell(
            child: _CatalogItem(
              catalog: catalog,
            ),
            onTap: () => context.vxNav.push(
              Uri(
                path: Routes.homeDetail,
                queryParameters: {
                  "name": catalog.name,
                },
              ),
              params: catalog,
            ),
          );
        },
      ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.xl2
                  .color(context.primaryColor)
                  .make()
                  .py8(),
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
                  AddToCart(
                    catalog,
                  ),
                ],
              ),
            ],
          ).expand(),
        ],
      ),
    ).color(context.cardColor).rounded.square(130).make().py(16);
  }
}

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart(this.catalog);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [
      AddMutation,
      RemoveMutation,
    ]);

    final CartModel cart = (VxState.store as Store).cart;

    bool isInCart = cart.items.contains(catalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(item: catalog);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
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
      errorBuilder: (c, e, s) {
        return GlobalCircularProgressIndicator();
      },
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
        : GlobalCircularProgressIndicator();
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
    final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/AbhiShake1/first_app_flutter/main/assets/files/catalog.json"));
    //await rootBundle.loadString("assets/files/catalog.json");

    final catalogJson = response.body;

    final decodedJson = jsonDecode(catalogJson);
    var productsData = decodedJson["products"];

    setState(() {
      CatalogModel.items =
          List.from(productsData).map<Item>((i) => Item.fromMap(i)).toList();
    });
  }
}

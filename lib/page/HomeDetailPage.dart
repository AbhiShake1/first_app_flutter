import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:first_app_flutter/widget/GlobalAppBar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: GlobalAppBar(context),
      body: Column(
        children: [
          Hero(
            tag: Key(catalog.id),
            child: Image.network(
              catalog.imageUrl,
              height: 520,
            ),
          ),
          _HomeDetailBody(
            catalog: catalog,
          ),
        ],
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}"
              .text
              .color(context.accentColor)
              .bold
              .xl3
              .make(),
          ElevatedButton(
            onPressed: () {},
            child: "Add to cart".text.make(),
            style: ElevatedButton.styleFrom(
              primary: context.accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ).wh(100, 50),
        ],
      ).p32().backgroundColor(context.cardColor),
    );
  }
}

class _HomeDetailBody extends StatelessWidget {
  final Item catalog;

  const _HomeDetailBody({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxArc(
      height: 30,
      arcType: VxArcType.CONVEY,
      edge: VxEdge.TOP,
      child: Container(
        color: context.cardColor,
        width: context.screenWidth,
        child: Column(
          children: [
            catalog.name.text
                .color(context.theme.focusColor)
                .extraBold
                .scale(2.4)
                .make()
                .py12(),
            catalog.desc.text
                .color(context.primaryColor)
                .italic
                .scale(1.2)
                .make()
                .py8(),
            catalog.descExtra.text
                .color(context.primaryColor)
                .italic
                .make()
                .px16()
                .py24(),
          ],
        ).p64(),
      ),
    ).expand();
  }
}

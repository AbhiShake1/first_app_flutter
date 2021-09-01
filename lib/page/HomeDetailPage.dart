import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Vx.blueGray300,
        appBar: AppBar(
          backgroundColor: Vx.blueGray300,
          elevation: 0,
          toolbarHeight: 60,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Vx.orange500,
              size: 35,
            ).p20(),
          ),
        ),
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
            "\$${catalog.price}".text.orange500.bold.xl3.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to cart".text.make(),
              style: ElevatedButton.styleFrom(
                primary: Vx.orange500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ).wh(100, 50),
          ],
        ).p32().backgroundColor(Colors.white),
      ),
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
        color: Colors.white,
        width: context.screenWidth,
        child: Column(
          children: [
            catalog.name.text.extraBlack.extraBold.scale(2.4).make().py12(),
            catalog.desc.text.blueGray300.italic.scale(1.2).make().py8(),
            catalog.descExtra.text.blueGray300.italic.make().px16().py24(),
          ],
        ).p64(),
      ),
    ).expand();
  }
}

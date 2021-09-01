import 'package:first_app_flutter/model/CartModel.dart';
import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:first_app_flutter/widget/GlobalAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        context,
        title: "Cart",
      ),
      //backgroundColor: context.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CartList().p32().expand(),
          120.heightBox,
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = CartModel();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        "\$${cart.totalPrice}".text.xl5.color(context.theme.accentColor).make().px32(),
        90.widthBox,
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              context.accentColor,
            ),
          ),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "Buying is not supported yet".text.make(),
            ),
          ),
          child: "Buy"
              .text
              .color(
                context.theme.focusColor,
              )
              .bold
              .make(),
        ).w32(context).p64(),
        //130.heightBox,
      ],
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (c, i) => ListTile(
        leading: Icon(
          Icons.done,
          color: context.theme.focusColor,
        ),
        trailing: IconButton(
          icon: Icon(
            CupertinoIcons.delete_solid,
            color: context.theme.focusColor,
          ),
          onPressed: () {},
        ),
        title: cart.items[i]?.name.text.color(context.theme.focusColor).make(),
      ),
    );
  }
}

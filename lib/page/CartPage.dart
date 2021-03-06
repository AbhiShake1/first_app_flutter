import 'package:first_app_flutter/core/Store.dart';
import 'package:first_app_flutter/model/CartModel.dart';
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
      //backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CartList().p32().expand(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as Store).cart;

    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      children: [
        VxBuilder(
          builder: (c, s, s_) => "\$${cart.totalPrice}"
              .text
              .xl5
              .bold
              .color(c.theme.accentColor)
              .make()
              .px32(),
          mutations: {
            RemoveMutation,
          },
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: context.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
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
              .xl4
              .make(),
        ).w(120).h(50).py64(),
        //130.heightBox,
      ],
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [
      RemoveMutation,
    ]);

    final CartModel cart = (VxState.store as Store).cart;

    return cart.items.isEmpty
        ? "No pending items :)\n\n  Happy shopping"
            .text
            .color(context.theme.focusColor)
            .xl3
            .makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (c, i) => ListTile(
              leading: Icon(
                CupertinoIcons.checkmark_seal,
                color: context.theme.focusColor,
              ),
              trailing: IconButton(
                icon: Icon(
                  CupertinoIcons.cart_badge_minus,
                  color: context.theme.focusColor,
                ),
                onPressed: () => RemoveMutation(
                  item: cart.items[i]!,
                ),
              ),
              title: cart.items[i]?.name.text
                  .color(context.theme.focusColor)
                  .make(),
            ),
          );
  }
}

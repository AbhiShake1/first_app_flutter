import 'package:first_app_flutter/widget/GlobalAppBar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        context,
        title: "Cart",
      ),
      backgroundColor: context.backgroundColor,
    );
  }
}

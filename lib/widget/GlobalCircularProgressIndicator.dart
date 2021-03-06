import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GlobalCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: context.theme.focusColor,
    ).centered();
  }
}

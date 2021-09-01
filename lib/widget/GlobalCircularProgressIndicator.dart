import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';

class GlobalCircularProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: context.accentColor,
    ).centered();
  }
}

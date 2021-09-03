import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GlobalAppBar extends AppBar {
  GlobalAppBar(BuildContext context, {String title = ""})
      : super(
          backgroundColor: context.backgroundColor,
          elevation: 0,
          toolbarHeight: 100,
          title: title.text.extraBold
              .scale(2.4)
              .color(context.theme.focusColor)
              .make()
              .px24(),
          leading: IconButton(
            onPressed: () => context.vxNav.pop(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              Icons.arrow_back_ios,
              color: context.accentColor,
              size: 35,
            ).px32(),
          ),
        );
}

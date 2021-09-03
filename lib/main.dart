import 'package:first_app_flutter/page/CartPage.dart';
import 'package:first_app_flutter/page/HomeDetailPage.dart';
import 'package:first_app_flutter/util/Themes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

import 'code/Store.dart';
import 'page/HomePage.dart';
import 'page/LoginPage.dart';
import 'util/Routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    VxState(
      store: Store(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      darkTheme: Themes.dark(context),
      theme: Themes.light(context),
      /*
      routes: {
        '/': (c) => HomePage(), //by default or if no path found
        Routes.home: (c) => HomePage(),
        Routes.login: (c) => LoginPage(),
        Routes.cart: (c) => CartPage(),
      },
       */
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        //by default or if no path found
        routes: {
          '/': (a, b) => MaterialPage(
                child: LoginPage(),
              ),
          Routes.home: (a, b) => MaterialPage(
                child: HomePage(),
              ),
          Routes.login: (a, b) => MaterialPage(
                child: LoginPage(),
              ),
          Routes.cart: (a, b) => MaterialPage(
                child: CartPage(),
              ),
          Routes.homeDetail: (uri, c) {
            final catalog = (VxState.store as Store).catalog.getByName(
                  uri.queryParameters["name"]!,
                );
            return MaterialPage(
              child: HomeDetailPage(
                catalog: catalog!,
              ),
            );
          }
        },
      ),
    );
  }
}

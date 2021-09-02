import 'package:first_app_flutter/model/CartModel.dart';
import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class Store extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  Store() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
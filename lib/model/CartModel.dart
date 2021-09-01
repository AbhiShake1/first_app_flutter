import 'package:first_app_flutter/model/CatalogModel.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<String> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel catalog) {
    _catalog = catalog;
  }

  List<Item?> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => items.fold(
        0,
        (previousValue, element) => previousValue + element!.price,
      );

  add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item);
  }
}

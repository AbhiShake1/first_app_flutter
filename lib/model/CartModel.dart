import 'package:first_app_flutter/code/Store.dart';
import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<String> _itemIds = [];

  set catalog(CatalogModel catalog) {
    _catalog = catalog;
  }

  List<Item?> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice => items.fold(
        0,
        (previousValue, element) => previousValue + element!.price,
      );
}

class AddMutation extends VxMutation<Store> {
  final Item item;

  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<Store> {
  final Item item;

  RemoveMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}

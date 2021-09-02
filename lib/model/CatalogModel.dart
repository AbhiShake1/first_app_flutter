class CatalogModel {
  static List<Item>? items;

  Item? getById(String id) => items?.firstWhere(
        (e) => e.id == id,
        orElse: null,
      );

  Item getByPosition(int position) => items![position];
}

class Item {
  final String id, name, desc, descExtra, color, imageUrl;
  final num price;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.descExtra,
      required this.color,
      required this.imageUrl,
      required this.price});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      color: map["color"],
      desc: map["desc"],
      descExtra: map["descExtra"],
      price: map["price"],
      imageUrl: map["imageUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "color": color,
      "desc": desc,
      "descExtra": descExtra,
      "price": price,
      "imageUrl": imageUrl,
    };
  }
}

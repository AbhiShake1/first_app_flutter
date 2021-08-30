class CatalogModel {
  static List<Item>? items;
}

class Item {
  final String id, name, desc, color, imageUrl;
  final num price;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.color,
      required this.imageUrl,
      required this.price});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      color: map["color"],
      desc: map["desc"],
      price: map["price"],
      imageUrl: map["imageUrl"],
    );
  }

  toMap() {
    return {
      "id": id,
      "name": name,
      "color": color,
      "desc": desc,
      "price": price,
      "imageUrl": imageUrl,
    };
  }
}

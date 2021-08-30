import 'package:first_app_flutter/model/CatalogModel.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.imageUrl),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.3,
          style: TextStyle(
            color: Theme.of(context).appBarTheme.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      color: Colors.black12,
      elevation: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      margin: EdgeInsets.all(8),
    );
  }
}

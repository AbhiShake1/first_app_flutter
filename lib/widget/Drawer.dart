import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://scontent.fktm1-1.fna.fbcdn.net/v/t1.6435-9/46470574_1891233157656811_8439262960253140992_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=e3f864&_nc_ohc=EgOuepU96YgAX9liZda&_nc_ht=scontent.fktm1-1.fna&oh=6287706ee64d3acb9200886d2ceb3e77&oe=6151A751";

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              accountEmail: Text("Account email text"),
              accountName: Text("Account name text"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
              margin: EdgeInsets.zero,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              textScaleFactor: 1.54,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text(
              "Profile",
              textScaleFactor: 1.54,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text(
              "Email Me",
              textScaleFactor: 1.54,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

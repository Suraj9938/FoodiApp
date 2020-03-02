import 'package:flutter/material.dart';
import 'package:foodi/screens/bottom_bar_screen.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 180,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                "Welcome to Foodi ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontFamily: "font1",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.pinterest.com/pin/589971619923206197/'),
            ),
            accountName: Text("Suraj9938"),
            accountEmail: Text("surajlalshrestha9@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text("Meals"),
            onTap: () {
              Navigator.pushNamed(context, BottomBarScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Filters"),
            onTap: () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

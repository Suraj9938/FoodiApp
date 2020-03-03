import 'package:flutter/material.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/favourites_screen.dart';

class Tab_View_Screen extends StatefulWidget {
  @override
  _Tab_View_ScreenState createState() => _Tab_View_ScreenState();
}

class _Tab_View_ScreenState extends State<Tab_View_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foodi'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryOverviewScreen(),
            //Favourites_Screen(),
          ],
        ),
      ),
      length: 2,
      initialIndex: 0,
    );
  }
}

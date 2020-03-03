import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';
import 'package:foodi/screens/bottom_bar_screen.dart';
import 'package:foodi/screens/category_meal_screen.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/filter_screen.dart';
import 'package:foodi/screens/meal_detail_screen.dart';
import 'package:foodi/screens/tab_view_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // ----------for adding / removing favourite meals ---
  void _toogleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  // ------ for checking if meal is favourite or not
  bool isMealFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foodi App",
      theme: ThemeData(
        primaryColor: Colors.redAccent.shade200,
        accentColor: Colors.deepOrangeAccent,
        fontFamily: "font1",
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontSize: 22, fontFamily: "font2"),
            ),
      ),
      //home: BottomBarScreen(),
      initialRoute: '/',
      routes: {
        //"/meal_screen": (ctx) => CategoryMealScreen()
        '/': (ctx) => BottomBarScreen(_favouriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toogleFavourite, isMealFavourite),
        BottomBarScreen.routeName: (ctx) => BottomBarScreen(_favouriteMeals),
        FilterScreen.routeName: (ctx) =>
            FilterScreen(setFilter: _setFilters, currentFilters: _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryOverviewScreen());
      },
    );
  }
}

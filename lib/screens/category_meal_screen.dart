import 'package:flutter/material.dart';
import 'package:foodi/dummy_data.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
//  final String title;
//  final Color color;
//
//  CategoryMealScreen({@required this.title, this.color});

  static const routeName = "/meal_screen";
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;

  // --------------didChangeDependencies is used because context is returned only after initState ---
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: color,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              duration: categoryMeals[index].duration,
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}

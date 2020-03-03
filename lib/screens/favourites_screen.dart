import 'package:flutter/material.dart';
import 'package:foodi/models/meal.dart';
import 'package:foodi/widgets/meal_item.dart';

class Favourites_Screen extends StatelessWidget {
  List<Meal> favouriteMeals;
  Favourites_Screen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            duration: favouriteMeals[index].duration,
          );
        },
        itemCount: favouriteMeals.length);
  }
}

import 'package:flutter/material.dart';
import 'package:foodi/widgets/category_item.dart';
import 'package:foodi/dummy_data.dart';

class CategoryOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(
            id: catData.id, title: catData.title, color: catData.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}

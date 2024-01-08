import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.meals});

  final List<Meal> meals;

  void goToMealsScreen(
    BuildContext context, {
    required Category category,
  }) {
    final categoryMeals = meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                  title: category.title,
                  meals: categoryMeals,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        children: availableCategories
            .map((e) => InkWell(
                  onTap: () => goToMealsScreen(context, category: e),
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.amber,
                  child: CategoryGridItem(item: e),
                ))
            .toList());
  }
}

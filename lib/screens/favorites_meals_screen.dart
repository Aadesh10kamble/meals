import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/screens/meals.dart';

class FavoritesMealsScreen extends StatelessWidget {
  const FavoritesMealsScreen({super.key, required this.meals});
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return MealsScreen(meals: meals);
  }
}

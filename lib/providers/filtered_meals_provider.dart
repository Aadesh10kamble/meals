import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/model/meal.dart';

final filteredMealProvider = Provider((ref) {
  final filter = ref.watch(filterProvider);
  final filteredMeals = dummyMeals.where((meal) {
    if (filter[FilterSet.gluten]! && !meal.isGlutenFree) return false;
    if (filter[FilterSet.vegan]! && !meal.isVegan) return false;
    if (filter[FilterSet.vegetarian]! && !meal.isVegetarian) return false;
    if (filter[FilterSet.lactose]! && !meal.isLactoseFree) return false;
    return true;
  }).toList();
  return filteredMeals;
});

import 'package:meals/model/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool updateFavoriteMeals(Meal meal) {
    final updatedList = List.of(state);

    final isFavorite = state.contains(meal);
    isFavorite ? updatedList.remove(meal) : updatedList.add(meal);

    state = updatedList;
    return isFavorite;
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());

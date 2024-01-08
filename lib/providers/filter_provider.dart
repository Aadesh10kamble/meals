import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterSet { gluten, vegan, vegetarian, lactose }

final initialState = {
  FilterSet.gluten: false,
  FilterSet.vegan: false,
  FilterSet.vegetarian: false,
  FilterSet.lactose: false
};

class FilterNotifier extends StateNotifier<Map<FilterSet, bool>> {
  FilterNotifier() : super(initialState);

  void setFilter(bool value, FilterSet key) {
    final updatedFilter = Map.of(state);
    updatedFilter[key] = value;
    state = updatedFilter;
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<FilterSet, bool>>(
        (ref) => FilterNotifier());

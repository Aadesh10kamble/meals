import 'package:flutter/material.dart';
import 'package:meals/providers/favorite_meal_provider.dart';
import 'package:meals/providers/filtered_meals_provider.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorites_meals_screen.dart';
import 'package:meals/screens/setting.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});
  @override
  ConsumerState<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int currentPage = 0;

  void changePage(int value) {
    setState(() => currentPage = value);
  }

  void changePageThroughDrawer(String identifier) async {
    Navigator.pop(context);
    if (identifier == "settings") {
      await Navigator.push<Map<String, int>>(
          context, MaterialPageRoute(builder: (ctx) => const SettingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealProvider);
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text(currentPage == 0 ? "Pick Category" : "Your Favorite")),
      drawer: MainDrawer(tileHandler: changePageThroughDrawer),
      body: currentPage == 0
          ? CategoriesScreen(meals: filteredMeals)
          : FavoritesMealsScreen(meals: favoriteMeals),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal_sharp), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outlined), label: "Favorites"),
        ],
        currentIndex: currentPage,
        onTap: changePage,
      ),
    );
  }
}

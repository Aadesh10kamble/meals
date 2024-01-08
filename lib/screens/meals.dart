import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/screens/single_meal_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void goToSingleMealScreen(BuildContext context, Meal meal) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SingleMealScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    final Widget onMealDisplay = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Meals For the Category Found!!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white)),
          Text("Try Different Category!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white)),
        ],
      ),
    );

    final mealsScreenBody = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: meals.isEmpty
          ? onMealDisplay
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () => goToSingleMealScreen(context, meals[index]),
                  child: MealItem(meal: meals[index])),
            ),
    );
    return title == null
        ? mealsScreenBody
        : Scaffold(
            appBar: AppBar(title: Text(title!)),
            body: meals.isEmpty ? onMealDisplay : mealsScreenBody);
  }
}

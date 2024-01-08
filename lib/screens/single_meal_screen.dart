import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/providers/favorite_meal_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleMealScreen extends ConsumerWidget {
  const SingleMealScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void openSnackBar(bool type) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(type ? 'Removed from Favorite!' : 'Marked as Favorite!')));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () {
                    final isFavorite = ref
                        .read(favoriteMealsProvider.notifier)
                        .updateFavoriteMeals(meal);
                    openSnackBar(isFavorite);
                  },
                  icon: Icon(ref.watch(favoriteMealsProvider).contains(meal)
                      ? Icons.star
                      : Icons.star_border),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl)),
              const SizedBox(height: 14),
              const Text(
                "Ingredient",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 14),
              ...meal.ingredients
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(e,
                            style: const TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                      ))
                  .toList(),
              const SizedBox(height: 14),
              const Text(
                "Steps",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 14),
              ...meal.steps
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          e,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ))
                  .toList()
            ],
          ),
        ));
  }
}

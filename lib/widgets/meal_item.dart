import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            const Icon(Icons.punch_clock,color: Colors.white),
                            const SizedBox(width: 5),
                            Text("${meal.duration.toString()} min",
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.shopping_bag,color: Colors.white),
                            const SizedBox(width: 5),
                            Text(meal.complexity.name,
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.attach_money_outlined,color: Colors.white),
                            const SizedBox(width: 5),
                            Text(meal.affordability.name,
                                style: const TextStyle(color: Colors.white))
                          ]),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

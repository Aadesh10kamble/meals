import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.item});

  final Category item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: [item.color.withOpacity(1), item.color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
          child: Text(item.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
    );
  }
}

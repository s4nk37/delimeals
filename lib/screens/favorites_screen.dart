import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;
  const FavoritesScreen({Key? key, required this.favoritedMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoritedMeals.isEmpty
        ? const Center(child: Text("No Favorites"))
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: favoritedMeals[index].id,
                title: favoritedMeals[index].title,
                imageUrl: favoritedMeals[index].imageUrl,
                duration: favoritedMeals[index].duration,
                complexity: favoritedMeals[index].complexity,
                affordability: favoritedMeals[index].affordability,
                ingredients: favoritedMeals[index].ingredients,
                removeItem: () {},
              );
            },
            itemCount: favoritedMeals.length,
          );
  }
}

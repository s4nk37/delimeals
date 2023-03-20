import 'dart:ui';

import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-details';

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 400,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontFamily: 'Caveat'),
      ),
    );
  }

  Widget buildListTile(BuildContext context, List<String> text,
      {double height = 150}) {
    return Container(
      height: height,
      width: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade400.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            width: 50,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              text[index],
            ),
          );
        },
        itemCount: text.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title.toString()),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildListTile(context, selectedMeal.ingredients),
          buildSectionTitle(context, 'Steps'),
          buildListTile(context, selectedMeal.steps, height: 200),
        ],
      ),
    );
  }
}

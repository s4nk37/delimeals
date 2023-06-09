import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-details';
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailScreen(
      {Key? key, required this.toggleFavorite, required this.isFavorite})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 400,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
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

  Widget buildListTile({required ListView list, double height = 150}) {
    return Container(
      height: height,
      width: 400,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10)),
      child: list,
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
        iconTheme: const IconThemeData(color: Colors.white70, size: 24),
      ),
      drawerScrimColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.pink.withOpacity(0.6),
                    child: IconButton(
                      icon: Icon(
                        isFavorite(mealId) ? Icons.star : Icons.star_border,
                        size: 40,
                        color: Colors.white24,
                      ),
                      onPressed: () {
                        toggleFavorite(mealId);
                      },
                    ),
                  ))
            ]),
            buildSectionTitle(context, 'Ingredients'),
            buildListTile(
              list: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(5),
                    width: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      selectedMeal.ingredients[index],
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildListTile(
                list: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
                height: 200),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, mealId);
          },
          child: const Icon(Icons.delete)),
    );
  }
}

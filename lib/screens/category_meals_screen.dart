import '/models/meal.dart';
import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = '/category-meals';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = '';
  List<Meal> displayMeals = [];
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'] as String;
      displayMeals = dummyMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
          iconTheme: const IconThemeData(color: Colors.white70, size: 24),
        ),
        body: displayMeals.isEmpty
            ? const Center(
                child: Text('Error 404'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(
                    id: displayMeals[index].id,
                    title: displayMeals[index].title,
                    imageUrl: displayMeals[index].imageUrl,
                    duration: displayMeals[index].duration,
                    complexity: displayMeals[index].complexity,
                    affordability: displayMeals[index].affordability,
                    ingredients: displayMeals[index].ingredients,
                    removeItem: _removeMeal,
                  );
                },
                itemCount: displayMeals.length,
              ));
  }
}

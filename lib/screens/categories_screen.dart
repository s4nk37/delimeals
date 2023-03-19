import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeals"),
        elevation: 0.0,
      ),
      body: GridView(
          padding: const EdgeInsets.all(15.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: size.width / 2,
              childAspectRatio: 3 / 2.2,
              crossAxisSpacing: size.width / 40,
              mainAxisSpacing: size.width / 40),
          children: dummyCategories.map((category) {
            return CategoryItem(
              title: category.title,
              color: category.color,
              id: category.id,
            );
          }).toList()),
    );
  }
}

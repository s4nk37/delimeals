import 'dart:ui';

import 'package:flutter/material.dart';
import '/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0.0,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.lighten,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                        child: Container(
                          width: 350,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 4),
                          color: Colors.grey.shade50.withOpacity(0.4),
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.black87),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

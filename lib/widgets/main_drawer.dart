import 'package:flutter/material.dart';
import 'dart:ui';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget tileBuilder(String title) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.pink.shade300.withOpacity(0.5),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: 'Caveat'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade100.withOpacity(0.2),
      elevation: 0.0,
      width: MediaQuery.of(context).size.width / 2,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(vertical: 40),
                color: Colors.pink.shade300.withOpacity(0.8),
                child: Text(
                  "Cooking up!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white70),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              tileBuilder('Home'),
              const SizedBox(
                height: 20,
              ),
              tileBuilder('Filters'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget tileBuilder(
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(title),
      onTap: () {
        tapHandler();
      },
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
                height: 115,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(vertical: 10),
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
              tileBuilder('Meals', Icons.dining, () {
                Navigator.of(context).pushNamed('/');
              }),
              const SizedBox(
                height: 20,
              ),
              tileBuilder('Filters', Icons.settings, () {}),
            ],
          ),
        ),
      ),
    );
  }
}

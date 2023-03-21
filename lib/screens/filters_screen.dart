import '../widgets/main_appbar.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters-screen';

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: 'abc'),
      drawer: MainDrawer(),
      body: Center(
        child: Text("Sanket"),
      ),
    );
  }
}

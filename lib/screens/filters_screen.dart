import '../widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  void initState() {
    _glutenfree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactosefree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildSwitchTile(
      {required bool value,
      required String title,
      required String subTitle,
      required Function updateValue}) {
    return SwitchListTile(
      value: value,
      onChanged: (value) {
        updateValue(value);
      },
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: const MainAppBar(title: 'Filters'),
      drawer: const MainDrawer(),
      drawerScrimColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.pink.shade50,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal preferences.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchTile(
                  value: _glutenfree,
                  title: 'Gluten-free',
                  subTitle: "Only includes gluten free meals",
                  updateValue: (newValue) {
                    setState(() {
                      _glutenfree = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  value: _vegetarian,
                  title: 'Vegetarian',
                  subTitle: "Only includes vegetarian free meals",
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  value: _vegan,
                  title: 'Vegan',
                  subTitle: "Only includes vegan meals",
                  updateValue: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchTile(
                  value: _lactosefree,
                  title: 'Lactose-free',
                  subTitle: "Only includes lactose free meals",
                  updateValue: (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.save),
        label: const Text('Save Preferences'),
        onPressed: () {
          final Map<String, bool> selectedFilters = {
            'gluten': _glutenfree,
            'vegetarian': _vegetarian,
            'vegan': _vegan,
            'lactose': _lactosefree,
          };
          widget.saveFilters(selectedFilters);
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
    );
  }
}

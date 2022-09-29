import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routName = '/filters';
  final Function saveFilters;
  final Map<String, bool> intiFilters;
  const FilterScreen(this.saveFilters, this.intiFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  void saveSelectedFilters() {
    final selectedFilters = {
      'gluten': _isGlutenFree,
      'lactose': _isLactoseFree,
      'vegan': _isVegan,
      'vegetarian': _isVegetarian
    };
    final args = ModalRoute.of(context).settings.arguments;
    print(args);

    widget.saveFilters(selectedFilters);

    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  void initState() {
    _isGlutenFree = widget.intiFilters['gluten'];
    _isLactoseFree = widget.intiFilters['lactose'];
    _isVegan = widget.intiFilters['vegan'];
    _isVegetarian = widget.intiFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(onPressed: saveSelectedFilters, icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(25),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile.adaptive(
                    title: Text('Gluten-free'),
                    subtitle: Text('Includes ONLY gluten-free meals'),
                    value: _isGlutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile.adaptive(
                    title: Text('Lactose-free'),
                    subtitle: Text('Includes ONLY lactose-free meals'),
                    value: _isLactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile.adaptive(
                    title: Text('Vegan meals'),
                    subtitle: Text('Includes ONLY vegan meals'),
                    value: _isVegan,
                    onChanged: (newValue) {
                      setState(() {
                        _isVegan = newValue;
                      });
                    },
                  ),
                  SwitchListTile.adaptive(
                    title: Text('Vegetarian meals'),
                    subtitle: Text('Includes ONLY vegetarian meals'),
                    value: _isVegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _isGlutenFree = false;
                              _isLactoseFree = false;
                              _isVegan = false;
                              _isVegetarian = false;
                            });
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Reset filter')),
                      ElevatedButton(
                          onPressed: saveSelectedFilters,
                          child: Text('Save changes'))
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}

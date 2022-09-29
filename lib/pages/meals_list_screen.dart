import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';
import '../pages/filters_screen.dart';

class MealsListScreen extends StatefulWidget {
  static String routeName = '/category-meals';

  final List<Meal> availableMeals;
  final Map<String, bool> intiFilters;

  MealsListScreen(this.availableMeals, this.intiFilters);

  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends State<MealsListScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routArgs['title'];
      final categoryId = routArgs['id'];
      displayedMeals = widget.availableMeals
          .where(
            (element) => element.categories.contains(categoryId),
          )
          .toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void onFilterTap() {
    Navigator.of(context)
        .pushNamed(FilterScreen.routName, arguments: '/category-meals');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(categoryTitle),
            actions: widget.intiFilters.containsValue(true)
                ? [
                    GestureDetector(
                        onTap: onFilterTap, child: Text('Selected filters: ')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.intiFilters['gluten']) Text('Gluten free'),
                          if (widget.intiFilters['lactose'])
                            Text('Lactose free'),
                          if (widget.intiFilters['vegan']) Text('Vegan'),
                          if (widget.intiFilters['vegetarian'])
                            Text('vegetarian'),
                        ]),
                  ]
                : null),
        body: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 450,
                mainAxisExtent: 320,
                childAspectRatio: 3 / 2),
            children: [
              if (displayedMeals.length == 0)
                Center(
                    child: Text(
                  'No items found in this category! Try to change filter settings',
                  softWrap: true,
                  style: Theme.of(context).textTheme.labelLarge,
                )),
              ...displayedMeals
                  .map((e) => MealItem(
                        meal: e,
                      ))
                  .toList()
            ])
        // ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return MealItem(meal: categoryMeals[index]);
        //     },
        //     itemCount: categoryMeals.length),
        );
  }
}

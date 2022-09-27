import 'package:flutter/material.dart';

import '../dummyData/dummy_data.dart';

import '../widgets/meal_item.dart';

class MealsListScreen extends StatelessWidget {
  static String routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId = routArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(categoryId),
        )
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisExtent: 320,
              childAspectRatio: 3 / 2),
          children: categoryMeals
              .map((e) => MealItem(
                    meal: e,
                  ))
              .toList(),
        )
        // ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return MealItem(meal: categoryMeals[index]);
        //     },
        //     itemCount: categoryMeals.length),
        );
  }
}

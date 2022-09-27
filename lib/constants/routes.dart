import 'package:flutter/widgets.dart';

import '../pages/meals_list_screen.dart';
import '../pages/category_screen.dart';
import '../pages/meal_detailed_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  MealsListScreen.routeName: (context) => MealsListScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  MealDetailedScreen.routeName: (context) => MealDetailedScreen()
};

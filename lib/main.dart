import 'package:flutter/material.dart';
// import './constants/routes.dart';
import './dummyData/dummy_data.dart';
import './models/meal.dart';

import '../pages/meals_list_screen.dart';
import '../pages/category_screen.dart';
import '../pages/meal_detailed_screen.dart';
import '../pages/tabs_screen.dart';
import '../pages/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> selectedFilters) {
    setState(() {
      _filters = selectedFilters;

      _availableMeals = DUMMY_MEALS.where(
        (Meal meal) {
          if (_filters['gluten'] && !meal.isGlutenFree) {
            return false;
          }
          if (_filters['lactose'] && !meal.isLactoseFree) {
            return false;
          }
          if (_filters['vegan'] && !meal.isVegan) {
            return false;
          }
          if (_filters['vegetarian'] && !meal.isVegetarian) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.orange,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
              titleMedium:
                  TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20),
            ),
      ),
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(),
        MealsListScreen.routeName: (context) =>
            MealsListScreen(_availableMeals, _filters),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        MealDetailedScreen.routeName: (context) => MealDetailedScreen(),
        FilterScreen.routName: (context) => FilterScreen(_setFilters, _filters),
      },
    );
  }
}

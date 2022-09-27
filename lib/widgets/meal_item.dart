import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../pages/meal_detailed_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem({Key key, this.meal}) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';

      case Complexity.Challenging:
        return 'Challenging';

      case Complexity.Hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordability {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';

      case Affordability.Pricey:
        return 'Pricey';

      case Affordability.Luxurious:
        return 'Luxurious';

      default:
        return 'Unknown';
    }
  }

  void selectMeal(ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailedScreen.routeName, arguments: meal.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  width: 300,
                  child: Text(
                    meal.title,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    Icon(Icons.timer, color: Colors.black54),
                    SizedBox(width: 5),
                    Text('${meal.duration} min'),
                  ]),
                  Row(children: [
                    Icon(Icons.work, color: Colors.black54),
                    SizedBox(width: 5),
                    Text(complexityText)
                  ]),
                  Row(children: [
                    Icon(Icons.attach_money, color: Colors.black54),
                    SizedBox(width: 5),
                    Text(affordability)
                  ]),
                ]),
          ),
        ]),
      ),
    );
  }
}

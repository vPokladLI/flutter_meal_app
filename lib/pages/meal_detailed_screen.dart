import 'package:flutter/material.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';
import '../models/meal.dart';
import '../dummyData/dummy_data.dart';

import '../widgets/titleParagraph.dart';

class MealDetailedScreen extends StatelessWidget {
  static String routeName = '/meal-detail';
  MealDetailedScreen({Key key}) : super(key: key);
  PreferredSizeWidget _buildAppbar(title) {
    return AppBar(
        title: Text(
      title,
      overflow: TextOverflow.fade,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final String mealId = ModalRoute.of(context).settings.arguments;
    final Meal selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );
    final appBar = _buildAppbar(selectedMeal.title);
    return Scaffold(
      appBar: appBar,
      body: !isLandscape
          ? Column(
              children: [
                Container(
                  width: double.infinity,
                  height: (mediaQuery.size.height -
                          mediaQuery.padding.top -
                          appBar.preferredSize.height -
                          6) /
                      3,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                TitleParagraph('Ingredients'),
                Container(
                  height: ((mediaQuery.size.height -
                              mediaQuery.padding.top -
                              appBar.preferredSize.height) /
                          3) -
                      40,
                  width: mediaQuery.size.width - 50,
                  // margin: EdgeInsets.only(bottom: 10),
                  child: ShaderMask(
                    shaderCallback: (Rect rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.purple,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.purple
                        ],
                        stops: [
                          0.0,
                          0.1,
                          0.9,
                          1.0
                        ], // 10% purple, 80% transparent, 10% purple
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: ListView.builder(
                        itemBuilder: (context, index) => Card(
                            color: Theme.of(context).colorScheme.secondary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Text(selectedMeal.ingredients[index]),
                            )),
                        itemCount: selectedMeal.ingredients.length),
                  ),
                ),
                TitleParagraph('Steps'),
                Container(
                    height: ((mediaQuery.size.height -
                                mediaQuery.padding.top -
                                80) /
                            3) -
                        40,
                    width: mediaQuery.size.width - 50,
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.purple,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.purple
                          ],
                          stops: [
                            0.0,
                            0.1,
                            0.9,
                            1.0
                          ], // 10% purple, 80% transparent, 10% purple
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: ListView.separated(
                          itemBuilder: (context, index) => ListTile(
                                leading: CircleAvatar(
                                  child: Text('# ${index + 1}'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  foregroundColor: Colors.black,
                                ),
                                title: Text(
                                  selectedMeal.steps[index],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              Divider(thickness: 2),
                          itemCount: selectedMeal.steps.length),
                    ))
              ],
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: mediaQuery.size.width / 3 - 10,
                child: Image.network(
                  selectedMeal.imageUrl,
                  height: mediaQuery.size.height - appBar.preferredSize.height,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                width: mediaQuery.size.width / 3 - 10,
                child: Column(children: [
                  TitleParagraph('Ingredients'),
                  Container(
                    height: mediaQuery.size.height -
                        mediaQuery.padding.top -
                        appBar.preferredSize.height -
                        50,
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.purple,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.purple
                          ],
                          stops: [
                            0.0,
                            0.1,
                            0.9,
                            1.0
                          ], // 10% purple, 80% transparent, 10% purple
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: ListView.builder(
                          itemBuilder: (context, index) => Card(
                              color: Theme.of(context).colorScheme.secondary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Text(selectedMeal.ingredients[index]),
                              )),
                          itemCount: selectedMeal.ingredients.length),
                    ),
                  )
                ]),
              ),
              Container(
                width: mediaQuery.size.width / 3 - 10,
                child: Column(children: [
                  TitleParagraph('Steps'),
                  Container(
                      height: mediaQuery.size.height -
                          mediaQuery.padding.top -
                          appBar.preferredSize.height -
                          50,
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.purple,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.purple
                            ],
                            stops: [
                              0.0,
                              0.1,
                              0.9,
                              1.0
                            ], // 10% purple, 80% transparent, 10% purple
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: ListView.separated(
                            itemBuilder: (context, index) => ListTile(
                                  leading: CircleAvatar(
                                    child: Text('# ${index + 1}'),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    foregroundColor: Colors.black,
                                  ),
                                  title: Text(
                                    selectedMeal.steps[index],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                Divider(thickness: 2),
                            itemCount: selectedMeal.steps.length),
                      ))
                ]),
              )
            ]),
    );
  }
}

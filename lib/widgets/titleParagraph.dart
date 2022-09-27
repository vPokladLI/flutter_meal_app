import 'package:flutter/material.dart';

class TitleParagraph extends StatelessWidget {
  final String title;
  const TitleParagraph(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).canvasColor
        ], radius: 5),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

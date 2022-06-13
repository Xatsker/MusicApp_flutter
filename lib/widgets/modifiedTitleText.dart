import 'package:flutter/material.dart';

class ModifiedTitleText extends StatelessWidget {
  String text;

  ModifiedTitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontFamily: "ReenieBeanie",
          fontSize: 70,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center);
  }
}

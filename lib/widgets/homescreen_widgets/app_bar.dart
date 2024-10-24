import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 229, 145, 0),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleText("B", const Color.fromARGB(255, 0, 255, 8)),
        titleText("M", const Color.fromARGB(255, 255, 224, 46)),
        titleText("I", const Color.fromARGB(255, 172, 0, 0)),
        titleText(" CHECK", Colors.white),
      ],
    ),
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
  );
}

Text titleText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

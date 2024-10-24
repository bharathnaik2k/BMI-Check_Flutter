import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 229, 145, 0),
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "B",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 255, 8),
          ),
        ),
        Text(
          "M",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 224, 46),
          ),
        ),
        Text(
          "I",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 172, 0, 0),
          ),
        ),
        Text(
          " CHECK",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
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

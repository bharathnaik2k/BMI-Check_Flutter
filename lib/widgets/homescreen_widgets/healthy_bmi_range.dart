import 'package:flutter/material.dart';

Text healthyBmiRange() {
  return const Text(
    "* Healthy BMI Range : 18.50 kg/m² - 25.00 kg/m²",
    style: TextStyle(
      color: Color.fromARGB(255, 0, 77, 3),
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      fontSize: 11,
    ),
  );
}

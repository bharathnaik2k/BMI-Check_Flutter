// result Container(BMI answer, BMI note, Result type svg image. All show In this Container)
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Container outputArea(
  double bmiData,
  Color bmiColor,
  String bmiNote,
  String bmiImage,
) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: const <BoxShadow>[
        BoxShadow(
          spreadRadius: 0.1,
          blurRadius: 10,
          color: Color.fromARGB(255, 0, 0, 0),
        )
      ],
      color: const Color.fromARGB(255, 240, 240, 240),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            overflow: TextOverflow.ellipsis,
            bmiData.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 55,
              color: bmiColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bmiNote.toString(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: bmiColor,
            ),
          ),
          const SizedBox(height: 10),
          SvgPicture.asset(
            bmiImage,
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 18),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class BmiController extends ChangeNotifier {
  double? bmiData;
  String? bmiNote;
  String? bmiImage;
  Color? bmiColor;

  void calculate(
    TextEditingController heightcontroller,
    TextEditingController weightcontroller,
  ) {
    double height =
        (double.parse(heightcontroller.text.trim()).toInt() / 100) * 2;
    bmiData = double.parse(weightcontroller.text.trim()).toInt() / height;
    resultData();
    notifyListeners();
  }

  void resultData() {
    if (bmiData! >= 1 && bmiData! < 18.5) {
      bmiNote = 'Under Weight';
      bmiImage = 'assets/svg/underweight.svg';
      bmiColor = const Color.fromARGB(255, 165, 124, 0);
    } else if (bmiData! >= 18.5 && bmiData! < 24.9) {
      bmiNote = 'Normal Weight';
      bmiImage = 'assets/svg/normalweight.svg';
      bmiColor = const Color.fromARGB(255, 0, 148, 22);
    } else if (bmiData! >= 25.0 && bmiData! < 29.9) {
      bmiNote = 'Over Weight';
      bmiImage = 'assets/svg/overweight.svg';
      bmiColor = const Color.fromARGB(255, 146, 81, 81);
    } else if (bmiData! >= 30.0 && bmiData! < 39.9) {
      bmiNote = 'Obesity';
      bmiImage = 'assets/svg/obesity.svg';
      bmiColor = const Color.fromARGB(255, 150, 57, 50);
    } else if (bmiData! >= 40.0) {
      bmiNote = 'Severe Obesity';
      bmiImage = 'assets/svg/severeobesity.svg';
      bmiColor = const Color.fromARGB(255, 133, 9, 0);
    } else {
      bmiData = 0;
      bmiColor = Colors.black;
      bmiNote = 'Enter correct value';
      bmiImage = 'assets/svg/exclamation.svg';
    }
  }
}

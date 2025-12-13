import 'package:bmi_app/src/widgets/homescreen_widgets/assets_conts.dart';
import 'package:flutter/material.dart';

class BmiController extends ChangeNotifier {
  double? bmiData;
  String? bmiNote;
  String? bmiImage;
  Color? bmiColor;

  final TextEditingController weightcontroller = TextEditingController();
  final TextEditingController heightcontroller = TextEditingController();

  void calculate() {
    double height =
        (double.parse(heightcontroller.text.trim()).toInt() / 100) * 2;
    bmiData = double.parse(weightcontroller.text.trim()).toInt() / height;
    resultData();
    notifyListeners();
  }

  void resultData() {
    if (bmiData! >= 1 && bmiData! < 18.5) {
      bmiNote = 'Under Weight';
      bmiImage = HomeScreenAssets.underWeightBMIRange;
      bmiColor = const Color.fromARGB(255, 165, 124, 0);
    } else if (bmiData! >= 18.5 && bmiData! < 24.9) {
      bmiNote = 'Normal Weight';
      bmiImage = HomeScreenAssets.normalBMIRange;
      bmiColor = const Color.fromARGB(255, 0, 148, 22);
    } else if (bmiData! >= 25.0 && bmiData! < 29.9) {
      bmiNote = 'Over Weight';
      bmiImage = HomeScreenAssets.overweightBMIRange;
      bmiColor = const Color.fromARGB(255, 146, 81, 81);
    } else if (bmiData! >= 30.0 && bmiData! < 39.9) {
      bmiNote = 'Obesity';
      bmiImage = HomeScreenAssets.obesityBMIRange;
      bmiColor = const Color.fromARGB(255, 150, 57, 50);
    } else if (bmiData! >= 40.0) {
      bmiNote = 'Severe Obesity';
      bmiImage = HomeScreenAssets.severeBMIRange;
      bmiColor = const Color.fromARGB(255, 133, 9, 0);
    } else {
      bmiData = 0;
      bmiColor = Colors.black;
      bmiNote = 'Enter correct value';
      bmiImage = HomeScreenAssets.erorrIcon;
    }
  }

  @override
  void dispose() {
    heightcontroller.dispose();
    weightcontroller.dispose();
    super.dispose();
  }
}

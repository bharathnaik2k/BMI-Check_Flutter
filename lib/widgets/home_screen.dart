import 'package:bmi_check_app/widgets/homescreen_widgets/app_bar.dart';
import 'package:bmi_check_app/widgets/homescreen_widgets/bmislogan.dart';
import 'package:bmi_check_app/widgets/homescreen_widgets/healthy_bmi_range.dart';
import 'package:bmi_check_app/widgets/homescreen_widgets/inputtiles.dart';
import 'package:bmi_check_app/widgets/homescreen_widgets/resultarea_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  double? bmiData;
  String? bmiNote;
  String? bmiImage;
  Color? bmiColor;

  calculate() {
    double height =
        (double.parse(heightcontroller.text.trim()).toInt() / 100) * 2;
    double result = double.parse(weightcontroller.text.trim()).toInt() / height;
    setState(() {
      bmiData = result;
      resultData();
    });
  }

  resultData() {
    if (bmiData! >= 1 && bmiData! < 18.5) {
      bmiNote = "Under Weight";
      bmiImage = "assets/svg/underweight.svg";
      bmiColor = const Color.fromARGB(255, 165, 124, 0);
    } else if (bmiData! >= 18.5 && bmiData! < 24.9) {
      bmiNote = "Normal Weight";
      bmiImage = "assets/svg/normalweight.svg";
      bmiColor = const Color.fromARGB(255, 0, 148, 22);
    } else if (bmiData! >= 25.0 && bmiData! < 29.9) {
      bmiNote = "Over Weight";
      bmiImage = "assets/svg/overweight.svg";
      bmiColor = const Color.fromARGB(255, 146, 81, 81);
    } else if (bmiData! >= 30.0 && bmiData! < 39.9) {
      bmiNote = "Obesity";
      bmiImage = "assets/svg/obesity.svg";
      bmiColor = const Color.fromARGB(255, 150, 57, 50);
    } else if (bmiData! >= 40.0) {
      bmiNote = "Severe Obesity";
      bmiImage = "assets/svg/severeobesity.svg";
      bmiColor = const Color.fromARGB(255, 133, 9, 0);
    } else {
      bmiData = 0;
      bmiColor = Colors.black;
      bmiNote = "Enter correct value";
      bmiImage = "assets/svg/exclamation.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                scale: 2.5,
                "android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png",
              ),
              bmiSlogan("Eat Wise,                  "),
              bmiSlogan("          Exercise and Rise"),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: 0.1,
                      blurRadius: 10,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 255, 162, 0),
                ),
                child: Column(
                  children: [
                    inputTile(weightcontroller, "assets/svg/weight.svg",
                        "Enter Your Weight :", "kg"),
                    const SizedBox(height: 12),
                    inputTile(heightcontroller, "assets/svg/height.svg",
                        "Enter Your height  :", "cm"),
                    const SizedBox(height: 12),
                    checkButton(context),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              healthyBmiRange(),
              const SizedBox(height: 12),
              bmiData == null
                  ? const SizedBox()
                  : outputArea(bmiData!, bmiColor!, bmiNote!, bmiImage!),
            ],
          ),
        ),
      ),
    );
  }

  // Result Check Batton
  TextButton checkButton(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
          Size(180, 40),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 0, 145, 5),
        ),
      ),
      onPressed: () {
        if (heightcontroller.text.isNotEmpty &&
            weightcontroller.text.isNotEmpty) {
          if (heightcontroller.text.startsWith('.') ||
              weightcontroller.text.startsWith('.')) {
          } else {
            setState(() {
              calculate();
              FocusScope.of(context).unfocus();
            });
          }
        }
      },
      child: const Text(
        "Check",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

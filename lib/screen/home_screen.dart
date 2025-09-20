import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:bmi_app/widgets/homescreen_widgets/app_bar.dart';
import 'package:bmi_app/widgets/homescreen_widgets/bmislogan.dart';
import 'package:bmi_app/widgets/homescreen_widgets/healthy_bmi_range.dart';
import 'package:bmi_app/widgets/homescreen_widgets/inputtiles.dart';
import 'package:bmi_app/widgets/homescreen_widgets/resultarea_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                scale: 8,
                "assets/image/logo512.png",
              ),
              const SizedBox(height: 10),
              bmiSlogan("Eat Wise,                  "),
              bmiSlogan("          Exercise and Rise"),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
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
                  children: <Widget>[
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
              Consumer<BmiController>(builder: (context, bmiController, _) {
                return bmiController.bmiData == null
                    ? const SizedBox()
                    : outputArea(
                        bmiController.bmiData!,
                        bmiController.bmiColor!,
                        bmiController.bmiNote!,
                        bmiController.bmiImage!);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Result Check Batton
  TextButton checkButton(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context, listen: false);
    return TextButton(
      style: const ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          Size(180, 40),
        ),
        backgroundColor: WidgetStatePropertyAll(
          Color.fromARGB(255, 0, 145, 5),
        ),
      ),
      onPressed: () {
        if (heightcontroller.text.isNotEmpty &&
            weightcontroller.text.isNotEmpty) {
          if (heightcontroller.text.startsWith('.') ||
              weightcontroller.text.startsWith('.')) {
          } else {
            bmiController.calculate(heightcontroller, weightcontroller);
            FocusScope.of(context).unfocus();
          }
        }
      },
      child: const Text(
        "Check",
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}

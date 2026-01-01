import 'package:bmi_app/src/controller/bmi_controller.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/app_bar.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/assets_conts.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/bmislogan.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/healthy_bmi_range.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/inputtiles.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/resultarea_container.dart';
import 'package:bmi_app/src/widgets/homescreen_widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context, listen: false);
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  scale: 8,
                  HomeScreenAssets.logo512,
                ),
                const SizedBox(height: 10),
                bmiSlogan('Eat Wise,                  '),
                bmiSlogan('          Exercise and Rise'),
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
                      inputTile(
                        bmiController.weightcontroller,
                        HomeScreenAssets.weightSVG,
                        'Enter Weight :',
                        'kg',
                      ),
                      const SizedBox(height: 12),
                      inputTile(
                        bmiController.heightcontroller,
                        HomeScreenAssets.heightSVG,
                        'Enter height  :',
                        'cm',
                        suffixIcon: DropdownButton(
                          items: const [
                            DropdownMenuItem(
                              value: 'kg',
                              child: Text(
                                'kg',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'lb',
                              child: Text(
                                'lb',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value == 'kg') {
                              bmiController.weightcontroller.text =
                                  bmiController.weightcontroller.text
                                      .replaceAll('lb', 'kg');
                            } else if (value == 'lb') {
                              bmiController.weightcontroller.text =
                                  bmiController.weightcontroller.text
                                      .replaceAll('kg', 'lb');
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      checkButton(context),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                healthyBmiRange(),
                const SizedBox(height: 12),
                Consumer<BmiController>(
                  builder: (context, bmiController, _) {
                    return bmiController.bmiData == null
                        ? const SizedBox()
                        : outputArea(
                            bmiController.bmiData!,
                            bmiController.bmiColor!,
                            bmiController.bmiNote!,
                            bmiController.bmiImage!,
                          );
                  },
                ),
              ],
            ),
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
        final heightValue = bmiController.heightcontroller.text.trim();
        final weightValue = bmiController.weightcontroller.text.trim();

        if (bmiController.heightcontroller.text.isNotEmpty &&
            bmiController.weightcontroller.text.isNotEmpty) {
          if (heightValue == '.' ||
              heightValue.split('.').length > 2 ||
              heightValue.isEmpty ||
              weightValue == '.' ||
              weightValue.split('.').length > 2 ||
              weightValue.isEmpty) {
            SnackbarWidget.showSnackBar(context, 'Please enter valid value');
          } else {
            bmiController.calculate();
            FocusScope.of(context).unfocus();
          }
        } else {
          SnackbarWidget.showSnackBar(context, 'Please enter value');
        }
      },
      child: const Text(
        'Check',
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}

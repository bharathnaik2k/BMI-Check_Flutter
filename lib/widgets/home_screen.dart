import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    double height = (double.parse(heightcontroller.text).toInt() / 100) * 2;
    double result = double.parse(weightcontroller.text).toInt() / height;
    setState(() {
      bmiData = result;
      note();
    });
  }

  note() {
    if (bmiData! < 18.5) {
      bmiNote = "Under Weight";
      bmiImage = "assets/svg/underweight.svg";
      bmiColor = Colors.amber;
    } else if (bmiData! >= 18.5 && bmiData! < 24.9) {
      bmiNote = "Normal Weight";
      bmiImage = "assets/svg/normalweight.svg";
      bmiColor = Colors.greenAccent;
    } else if (bmiData! >= 25.0 && bmiData! < 29.9) {
      bmiNote = "Over Weight";
      bmiImage = "assets/svg/overweightt.svg";
      bmiColor = Colors.redAccent;
    } else if (bmiData! >= 30.0 && bmiData! < 39.9) {
      bmiNote = "Obesity";
      bmiImage = "assets/svg/obesity.svg";
      bmiColor = Colors.red;
    } else if (bmiData! > 40.0) {
      bmiNote = "Severe Obesity";
      bmiImage = "assets/svg/severeobesity.svg";
      bmiColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 122, 0),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "B",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 112, 255, 117),
              ),
            ),
            Text(
              "M",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 241, 90),
              ),
            ),
            Text(
              "I",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 94, 0),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              scale: 2.5,
              "android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png",
            ),
            const Text(
              "Eat Wise,                  ",
              style: TextStyle(
                  fontFamily: "Lobster",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "          Exercise and Rise",
              style: TextStyle(
                fontFamily: "Lobster",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 192, 122, 0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/weight.svg",
                          height: 26,
                          width: 26,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Enter Your Weight :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            controller: weightcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              hintText: "Kg",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/height.svg",
                          height: 26,
                          width: 26,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Enter Your Height  :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            controller: heightcontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              hintText: "Cm",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
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
                        setState(() {
                          calculate();
                          // note();
                          FocusScope.of(context).unfocus();
                        });
                      }
                    },
                    child: const Text(
                      "Check",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "* Healthy BMI Range : 18.5 kg/m² - 25 kg/m²",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 77, 3),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 15),
            bmiData == null
                ? const SizedBox()
                : Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.2,
                          child: SvgPicture.asset(
                            "$bmiImage",
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                bmiData!.toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 48,
                                  color: bmiColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                bmiNote == null ? "" : bmiNote!.toString(),
                                style: TextStyle(
                                  color: bmiColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

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

  calculate() {
    double height = (int.parse(heightcontroller.text).toInt() / 100) * 2;
    double result = int.parse(weightcontroller.text).toInt() / height;
    bmiData = result;
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
                color: Color.fromARGB(255, 255, 122, 113),
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
              "Healthy BMI Range : 18.5 kg/m² - 25 kg/m²",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 145, 5),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmiData!.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         Text("data")
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: 0.2,
                    child: SvgPicture.asset(
                      "assets/svg/normalweight.svg",
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

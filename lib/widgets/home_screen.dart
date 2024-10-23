import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Text(
                    "Enter Your Weight",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    "assets/svg/weight.svg",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
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
                color: Colors.amber,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Text(
                    "Enter Your Height",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset(
                    "assets/svg/height.svg",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
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
            TextButton(
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(double.infinity, 20),
                ),
              ),
              onPressed: () {},
              child: const Text("Check"),
            ),
          ],
        ),
      ),
    );
  }
}

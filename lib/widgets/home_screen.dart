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
            Container(
              padding: const EdgeInsets.all(12),
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
            Container(
              padding: const EdgeInsets.all(12),
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
          ],
        ),
      ),
    );
  }
}

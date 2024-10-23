import 'package:bmi_check_app/widgets/home_screen.dart';
import 'package:bmi_check_app/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "exo2",
      ),
      initialRoute: "/SplashScreen",
      routes: {
        "/SplashScreen": (BuildContext context) => const SplashScreen(),
        "/HomeScreen": (BuildContext context) => const HomeScreen()
      },
    );
  }
}

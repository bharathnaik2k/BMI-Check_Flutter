import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:bmi_app/controller/settings_controller.dart';
import 'package:bmi_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BmiController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'exo2',
      ),
      initialRoute: '/HomeScreen',
      routes: {'/HomeScreen': (BuildContext context) => HomeScreen()},
    );
  }
}

import 'package:bmi_app/src/controller/bmi_controller.dart';
import 'package:bmi_app/src/controller/settings_controller.dart';
import 'package:bmi_app/src/screen/home_screen.dart';
import 'package:bmi_app/src/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BmiController(),
          child: const HomeScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsController(),
          child: const SettingsScreen(),
        ),
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
      darkTheme: ThemeData.light(),
      theme: ThemeData(
        fontFamily: 'exo2',
      ),
      initialRoute: '/HomeScreen',
      routes: {
        '/HomeScreen': (BuildContext context) => const HomeScreen(),
        '/SettingsScreen': (BuildContext context) => const SettingsScreen(),
      },
    );
  }
}

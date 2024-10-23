import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  navi(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed("/HomeScreen"),
    );
  }

  @override
  Widget build(BuildContext context) {
    navi(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 134, 101, 0),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/image/logo.png",
          ),
        ),
      ),
    );
  }
}

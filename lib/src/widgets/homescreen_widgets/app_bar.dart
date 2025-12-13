import 'package:bmi_app/src/screen/settings_screen.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 229, 145, 0),
    title: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        titleText('B', const Color.fromARGB(255, 0, 170, 6)),
        titleText('M', const Color.fromARGB(255, 255, 224, 46)),
        titleText('I', const Color.fromARGB(255, 172, 0, 0)),
        titleText(' CHECK', const Color.fromARGB(255, 255, 255, 255)),
      ],
    ),
    // centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          ),
        ),
        icon: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      const SizedBox(width: 8),
    ],
  );
}

Text titleText(String text, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

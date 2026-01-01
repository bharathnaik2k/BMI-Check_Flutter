import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

Container inputTile(
  TextEditingController weightcontroller,
  String svgImage,
  String inputName,
  String hintText, {
  Widget? suffixIcon,
}) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: <Widget>[
        SvgPicture.asset(
          svgImage,
          height: 26,
          width: 26,
        ),
        const SizedBox(width: 5),
        Text(
          inputName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: TextField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9.]'),
              )
            ],
            controller: weightcontroller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 230, 230, 230),
              filled: true,
              contentPadding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    ),
  );
}

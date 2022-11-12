import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textRegular,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        border: const OutlineInputBorder(),
        prefixIcon: IconTheme(
            data: const IconThemeData(color: Colors.white), child: Icon(icon)),
        labelStyle: const TextStyle(color: Colors.white),
        labelText: labelText,
      ),
    );
  }
}

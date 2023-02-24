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
      style:
          textRegular.copyWith(color: Theme.of(context).colorScheme.secondary),
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).backgroundColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).backgroundColor)),
        border: const OutlineInputBorder(),
        prefixIcon: IconTheme(
            data: IconThemeData(color: Theme.of(context).backgroundColor),
            child: Icon(icon)),
        labelStyle: TextStyle(color: Theme.of(context).backgroundColor),
        labelText: labelText,
      ),
    );
  }
}

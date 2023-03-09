import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  bool obscureText;
  final bool isToggleEnabled;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  CustomTextField(
      {Key? key,
      required this.label,
      this.isToggleEnabled = false,
      this.obscureText = false,
      required this.controller,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          label: Text(
            widget.label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          suffixIcon: widget.isToggleEnabled
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  child: (widget.obscureText
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.remove_red_eye_outlined)),
                )
              : null),
    );
  }
}

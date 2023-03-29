import 'package:flutter/material.dart';

class ActiveButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final void Function() onTap;
  const ActiveButton({Key? key, this.label, this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black87),
      child: label == null
          ? child!
          : Text(
              label!,
              style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black87
                      : Colors.white),
            ),
    );
  }
}

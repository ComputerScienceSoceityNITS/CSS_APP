import 'package:flutter/material.dart';

class GhostButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final void Function()? onTap;
  const GhostButton({Key? key, this.label, this.child, required this.onTap})
      : assert(label != null || child != null,
            "Either label or child must be provided"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black87),
        child: label == null ? child! : Text(label!));
  }
}

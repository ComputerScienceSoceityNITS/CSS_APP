import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final Color backgroundColor;
  final double backgroundCircleSize;
  const ExpandedButton(
      {Key? key,
      required this.child,
      this.onTap,
      this.backgroundColor = Colors.transparent,
      this.backgroundCircleSize = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: backgroundCircleSize,
        width: backgroundCircleSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(backgroundCircleSize),
        ),
        child: child,
      ),
    );
  }
}

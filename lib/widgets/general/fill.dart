import 'package:flutter/material.dart';

class Fill extends StatelessWidget {
  final Widget child;
  final double height;
  const Fill({Key? key, required this.child, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / height);
    return OverflowBox(
      child: Column(
        children: [
          for (int i = 0; i < MediaQuery.of(context).size.height / height; i++)
            child
        ],
      ),
    );
  }
}

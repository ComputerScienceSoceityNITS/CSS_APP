// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CSSBGText extends StatelessWidget {
  const CSSBGText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "CSS",
      style: TextStyle(
        fontSize: 110,
        color: Theme.of(context).secondaryHeaderColor,
      ),
    );
  }
}

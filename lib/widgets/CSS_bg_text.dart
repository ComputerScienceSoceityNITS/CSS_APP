// ignore_for_file: file_names

import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';

class CSSBGText extends StatelessWidget {
  const CSSBGText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 100, 0, 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Computer\nScience\nSociety',
          textAlign: TextAlign.left,
          style: textBGLarge.copyWith(
              color: Theme.of(context).backgroundColor.withOpacity(0.1)),
        ),
      ),
    );
  }
}

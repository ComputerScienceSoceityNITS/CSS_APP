// ignore_for_file: file_names

import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/state_handlers/theme/brightness/light.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class CSSBGText extends StatelessWidget {
  const CSSBGText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 100, 0, 0),
      child: Align(
        alignment: Alignment.topLeft,
        // child: Text(
        //   'CSS',
        //   textAlign: TextAlign.left,
        //   style: textBGLarge.copyWith(
        //       color: Theme.of(context).backgroundColor.withOpacity(0.1)),
        // ),
        child: StrokeText(
            text: "CSS",
            textStyle: TextStyle(
              fontSize: 110,
              color: Theme.of(context).brightness==Brightness.dark ? Colors.black : Colors.white,
            ),
            strokeWidth: 10,
            strokeColor: Theme.of(context).backgroundColor.withOpacity(0.4)),
      ),
    );
  }
}

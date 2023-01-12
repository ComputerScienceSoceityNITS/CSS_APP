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
        child: StrokeText(
            text: "CSS",
            textStyle: TextStyle(
              fontSize: 110,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
            strokeWidth: 10,
            strokeColor: Theme.of(context).backgroundColor.withOpacity(0.4)),
      ),
    );
  }
}

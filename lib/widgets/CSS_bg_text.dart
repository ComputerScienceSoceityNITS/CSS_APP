import 'package:flutter/cupertino.dart';
import 'package:cssapp/configs/configs.dart';

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
          style: textBGLarge,
        ),
      ),
    );
  }
}

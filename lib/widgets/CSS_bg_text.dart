// ignore_for_file: file_names

import 'package:cssapp/state_handlers/theme/brightness/dark.dart';
import 'package:cssapp/state_handlers/theme/brightness/light.dart';
import 'package:cssapp/utils/storage_handler.dart';
import 'package:flutter/material.dart';

class CSSBGText extends StatelessWidget {
  const CSSBGText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          'CSS',
          style: TextStyle(
            fontSize: 70,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 8
              ..color =!StorageHandler().isDarkTheme()? Color.fromARGB(255, 4, 5, 6).withOpacity(0.6):Colors.grey.withOpacity(0.6),
          ),
        ),
        // Solid text as fill.
        Text(
          'CSS',
          style: TextStyle(
            fontSize: 70,
            color:!StorageHandler().isDarkTheme()? Colors.grey.withOpacity(0.6):Color.fromARGB(255, 4, 5, 6).withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class CSSText extends StatelessWidget {
  const CSSText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text largeText({required String text, Color? color}) {
      return Text(text,
          style: textLarge.copyWith(
              color: color ?? Theme.of(context).backgroundColor));
    }

    return Column(
      children: [
        largeText(text: 'COMPUTER'),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Pallet.accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: largeText(text: 'SCIENCE', color: Colors.white),
        ),
        largeText(text: 'SOCIETY')
      ],
    );
  }
}

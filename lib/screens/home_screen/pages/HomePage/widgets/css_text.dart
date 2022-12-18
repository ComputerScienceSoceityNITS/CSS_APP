import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class CSSText extends StatelessWidget {
  const CSSText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text largeText(String text) {
      return Text(text,
          style: textLarge.copyWith(color: Theme.of(context).backgroundColor));
    }

    return Column(
      children: [
        largeText('COMPUTER'),
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
          child: largeText('SCIENCE'),
        ),
        largeText('SOCIETY')
      ],
    );
  }
}

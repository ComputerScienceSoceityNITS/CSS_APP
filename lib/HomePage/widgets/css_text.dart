import 'package:flutter/cupertino.dart';
import 'package:cssapp/configs/configs.dart';

class CSSText extends StatelessWidget {
  const CSSText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('COMPUTER', style: textLarge),
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
          child: const Text(
            'SCIENCE',
            style: textLarge,
          ),
        ),
        const Text('SOCIETY', style: textLarge)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class CSSText extends StatelessWidget {
  const CSSText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.only(right: 40),
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Pallet.greyDark,
          border: Border.all(width: 0.5, color: Colors.grey),
        ),
        child: const Center(
          child: Text("CSS", style: textStylisedGeostarSmall),
        ),
        width: 100,
        height: 50,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class EventText extends StatelessWidget {
  const EventText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 60,
          height: 66,
          child: Card(
            color: Pallet.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "E",
                textAlign: TextAlign.center,
                style: textStylisedOrnamentalMedium,
              ),
            ),
          ),
        ),
        Text(
          "VENTS",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).backgroundColor),
        ),
      ],
    );
  }
}

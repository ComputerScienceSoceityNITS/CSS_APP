import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class TagText extends StatelessWidget {
  const TagText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Wrap(
        spacing: 10,
        children: [
          Text("Participate",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "EastSeaDokdo",
                  color: Theme.of(context).colorScheme.background)),
          const Text("Enjoy",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "EastSeaDokdo",
                  color: Pallet.accentColor)),
          Text("Learn",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "EastSeaDokdo",
                  color: Theme.of(context).colorScheme.background)),
        ],
      ),
    );
  }
}

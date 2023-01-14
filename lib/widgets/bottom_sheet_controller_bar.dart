import 'package:flutter/material.dart';

class BottomSheetControllerBar extends StatelessWidget {
  const BottomSheetControllerBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      height: 4,
      width: 100,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(2)),
    );
  }
}

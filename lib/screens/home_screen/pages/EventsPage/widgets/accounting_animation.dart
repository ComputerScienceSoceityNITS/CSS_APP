import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class AccountingAnimation extends StatelessWidget {
  const AccountingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AnimatedOpacity(
        opacity: 0.7,
        duration: const Duration(milliseconds: 10),
        child: Assets.lottieAccounting,
      ),
    );
  }
}

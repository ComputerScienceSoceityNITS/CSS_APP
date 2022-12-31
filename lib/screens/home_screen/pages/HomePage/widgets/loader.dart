import 'package:flutter/cupertino.dart';
import 'package:cssapp/configs/configs.dart';

class LottieLoader extends StatelessWidget {
  const LottieLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Center(
        child: Assets.lottieLoader,
      ),
    );
  }
}

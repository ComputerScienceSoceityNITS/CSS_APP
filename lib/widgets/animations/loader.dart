import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';

class LottieLoader extends StatelessWidget {
  const LottieLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 0.3,
      duration: const Duration(milliseconds: 10),
      child: Center(
        child: Assets.lottieLoader,
      ),
    );
  }
}

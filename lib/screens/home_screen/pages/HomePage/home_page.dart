import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'events/events.dart';
import 'package:lottie/lottie.dart';
import 'widgets/widgets.dart';
import 'package:cssapp/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const double gap = 35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            const CSSBGText(),
            const LottieLoader(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      child: LottieBuilder(
                          lottie: Assets.lottieCSS.lottie, height: 80),
                    ),
                  ),
                  const CSSText(),
                  const SizedBox(height: gap),
                  const Text(
                    "Department of Computer Science and Engineering\nNational Institute of Technology, Silchar",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: gap),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: LottieBuilder(
                          lottie: Assets.lottieNetworking.lottie,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: const [
                        SizedBox(height: gap),
                        Text('ABOUT US', style: textLarge),
                        SizedBox(height: gap),
                        SizedBox(
                          width: 300,
                          child: Text(
                            "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. Computer Science Engineering branch of NIT Silchar stands with the highest number of placements and talented minds.",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.3),
                          ),
                        ),
                        SizedBox(height: 80),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 35),
                          child: Events(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 200,
                    child: LottieBuilder(
                        lottie: Assets.lottieRainMan.lottie,
                        fit: BoxFit.fitHeight),
                  ),
                  const Text(
                    "EXECUTIVE MEMBERS",
                    style: textLarge,
                  ),
                  const ExecutiveMembers(),
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 120,
                        child: LottieBuilder(
                          lottie: Assets.lottieBell.lottie,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const Text("UPCOMING EVENTS", style: textLarge),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Nothing to Show!\nCome back later",
                        style: TextStyle(
                            color: Pallet.grey,
                            fontSize: 20,
                            fontFamily: 'Anton',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 150,
                        child: LottieBuilder(
                            lottie: Assets.lottieDrone.lottie,
                            fit: BoxFit.fitHeight),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

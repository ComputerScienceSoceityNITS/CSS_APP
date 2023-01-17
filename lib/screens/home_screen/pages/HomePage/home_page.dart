import 'dart:math';

import 'package:cssapp/utils/storage_handler.dart';
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
      body: SafeArea(
        child: Stack(
          children: [
            !StorageHandler().isDarkTheme()
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.3, 0.7, 0.8, 1],
                        colors: [
                          Color.fromARGB(138, 255, 64, 128),
                          Color.fromARGB(125, 231, 186, 186),
                          Color.fromARGB(170, 94, 144, 231),
                          Color.fromARGB(132, 96, 125, 139),
                          Color.fromARGB(170, 255, 64, 128)
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.white,
                          // const Color.fromARGB(255, 250, 200, 124)
                          //     .withOpacity(0.9),
                          const Color.fromARGB(255, 255, 132, 173)
                              .withOpacity(0.9),
                          const Color.fromARGB(255, 251, 65, 127)
                              .withOpacity(0.9),
                          Colors.black
                        ],
                        center: const Alignment(-0.9, -0.5),
                        focal: const Alignment(-1.2, -0.3),
                        stops: const [0.02, 0.2, 0.45, 1],
                        radius: 0.8,
                      ),
                    ),
                  ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  const CSSText(),
                  const SizedBox(height: gap),
                  const Text(
                    "Department of Computer Science and Engineering\nNational Institute of Technology, Silchar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Quintessential',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: gap),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: LottieBuilder(
                        lottie: Theme.of(context).brightness == Brightness.dark
                            ? Assets.lottieCssGlobeLight.lottie
                            : Assets.lottieCssGlobeDark.lottie,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    width: min(MediaQuery.of(context).size.width * 0.9, 500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1.5),
                      gradient: LinearGradient(
                        colors: Theme.of(context).brightness == Brightness.dark
                            ? [
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.2),
                              ]
                            : [
                                Colors.black.withOpacity(0.05),
                                Colors.black.withOpacity(0.05)
                              ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors:
                              Theme.of(context).brightness == Brightness.dark
                                  ? [Colors.blue, Colors.transparent]
                                  : [Colors.transparent, Colors.transparent],
                          center: const Alignment(0, -0.5),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: gap),
                          Text('ABOUT US',
                              style: textLarge.copyWith(
                                  color: Theme.of(context).backgroundColor)),
                          const SizedBox(height: gap),
                          SizedBox(
                            width: 300,
                            child: Text(
                              "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. Computer Science Engineering branch of NIT Silchar stands with the highest number of placements and talented minds.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.3,
                                  color: Theme.of(context).backgroundColor),
                            ),
                          ),
                          const SizedBox(height: 80),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 35),
                            child: Events(),
                          )
                        ],
                      ),
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
                  Text(
                    "PILLARS OF CSS",
                    style: textLarge.copyWith(
                        color: Theme.of(context).backgroundColor),
                  ),
                  const ExecutiveMembers(),
                  const SizedBox(height: 50),
                  Text("ANNOUNCEMENTS",
                      style: textLarge.copyWith(
                          color: Theme.of(context).backgroundColor)),
                  Carousel(
                    screenSize: MediaQuery.of(context).size,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

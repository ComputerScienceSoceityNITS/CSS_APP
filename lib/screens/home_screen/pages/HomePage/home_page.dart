import 'package:cssapp/screens/home_screen/pages/HomePage/widgets/carousel.dart';
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
                          Color.fromARGB(255, 250, 200, 124),
                          Color.fromARGB(255, 255, 132, 173),
                          Color.fromARGB(255, 251, 65, 127),
                          Colors.black
                        ],
                        center: Alignment(-0.9, -0.5),
                        focal: Alignment(-1.2, -0.3),
                        stops: [0.04, 0.1, 0.3, 0.45, 1],
                        radius: 0.6,
                      ),
                    ),
                  ),
            const Positioned(child: const CSSBGText(), bottom: 500, left: 170),
            const LottieLoader(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
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
                          lottie: Assets.lottieNetworking.lottie,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).canvasColor,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors:
                              Theme.of(context).brightness == Brightness.dark
                                  ? [Colors.blue, Colors.black]
                                  : [Colors.white, Colors.white],
                          center: Alignment(0, -0.5),
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
                    "EXECUTIVE MEMBERS",
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

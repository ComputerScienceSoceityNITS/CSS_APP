import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/HomePage/events.dart';
import 'package:cssapp/HomePage/executive_members_card.dart';
import 'package:cssapp/configs/configs.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: (MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width -
                MediaQuery.of(context).padding.top
            : MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                // fit: StackFit.passthrough,
                // clipBehavior: Clip.hardEdge,
                // alignment: AlignmentDirectional.topStart,
                children: [
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 100, 0, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Computer',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.1),
                                  fontSize: 70,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Science',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.1),
                                  fontSize: 70,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Society',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.1),
                                  fontSize: 70,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: AnimatedOpacity(
                        opacity: 0.3,
                        duration: const Duration(milliseconds: 10),
                        child: Lottie.asset(
                          Paths.lottieLoader,
                          // height: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ]),
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? SizedBox(
                          child: AnimatedOpacity(
                            opacity: 0.3,
                            duration: const Duration(milliseconds: 10),
                            child: Lottie.asset(
                              Paths.lottieLoader,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      // padding: EdgeInsets.all(0),
                      // margin: EdgeInsets.all(0),
                      height: 125,
                      child: Column(
                        children: [
                          Expanded(
                            child: FractionallySizedBox(
                              widthFactor: 0.35,
                              heightFactor: 0.9,
                              child: Lottie.asset(Paths.lottieCSS,
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 65,
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "COMPUTER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 33.98,
                              fontFamily: 'Anton',
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 70,
                        width: 200,
                        child: Card(
                            color: const Color(0xFFBC4E9C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "SCIENCE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 33.98,
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.w900),
                              ),
                            ))),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 65,
                      width: 200,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "SOCIETY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 33.98,
                              fontFamily: 'Anton',
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Department of Computer Science and Engineering",
                      style: const TextStyle(color: Colors.white),
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "National Institute of Technology, Silchar",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Lottie.asset(Paths.lottieNetworking,
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "ABOUT US",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 33.98,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const SizedBox(
                            width: 300,
                            child: Text(
                              "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. Computer Science Engineering branch of NIT Silchar stands with the highest number of placements and talented minds.",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Events(),
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      height: 200,
                      child: Lottie.asset(Paths.lottieRainMan,
                          fit: BoxFit.fitHeight),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Center(
                              child: Text(
                                "EXECUTIVE MEMBERS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 33.98,
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Center(
                              child: Executivemembers(),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 120,
                                    child: Lottie.asset(Paths.lottieBell,
                                        fit: BoxFit.fitHeight),
                                  ),
                                  const Text(
                                    "UPCOMING EVENTS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 33.98,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                height: 200,
                                child: Lottie.asset(Paths.lottieDrone,
                                    fit: BoxFit.fitHeight),
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                child: Column(children: [
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    "Nothing to Show!",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 20,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Come back later",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 20,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

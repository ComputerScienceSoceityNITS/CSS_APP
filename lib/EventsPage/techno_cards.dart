import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cssapp/configs/configs.dart';

class Technocards extends StatelessWidget {
  var events = [
    {
      "title1": "A",
      "title": "BACUS",
      "title2": "TECH",
      "picture": Assets.eventTIMGAbacusTech,
      "details": "",
      "Event1": "Chess",
      "Event2": "Valo",
      "Event3": "Meme competition",
      "Event4": "Article writing",
    },
    {
      "title1": "A",
      "title": "BACUS",
      "title2": "IIT",
      "picture": Assets.eventTIMGAbacusIIT,
      "details": "",
      "Event1": "Chess",
      "Event2": "Valorant Tournaments",
      "Event3": "Scrible",
      "Event4": "General Quiz",
    },
    {
      "title1": "C",
      "title": "SS",
      "title2": "HACKS",
      "picture": Assets.eventTIMGCSSHacks,
      "details":
          "An amazing hackathon for developers and dev enthusiasts solving problems given by the judges. This is the one big opportunity for all the hackathon lovers to check their innovative and presentation skills. This provides the participants a upperhand experience for all the hackathon they will be participating in.",
      "Event1": "",
      "Event2": "",
      "Event3": "",
      "Event4": "",
    },
    {
      "title1": "E",
      "title": "NIGMA",
      "title2": "",
      "picture": Assets.eventTIMGEnigma,
      "details":
          "Computer Science Society organizes coding contests for first year students. This contest being open to all enhances a good competitive environment for the students. The questions are made such that even students will little or basic Knowledge of programming can surely attempt the questions. Learning programming is now an essential skill for various placement interviews and our society encourages more and more participation in such activities.",
      "Event1": "",
      "Event2": "",
      "Event3": "",
      "Event4": "",
    },
    {
      "title1": "C",
      "title": " CLASSES",
      "title2": "",
      "picture": Assets.eventTIMGCClasses,
      "details":
          "Basics of programming and C language is taught by the computer science students of second year in order to enlighten the first year students about the resources to study tips and tricks to move ahead in terms of fundamentals and knowledge about Computer Science.",
      "Event1": "",
      "Event2": "",
      "Event3": "",
      "Event4": "",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: LottieBuilder(
                              lottie: Assets.lottieTechno.lottie,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: events.map((entry) {
                              return FlipCard(
                                fill: Fill
                                    .fillBack, // Fill the back side of the card to make in the same size as the front.
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 30),
                                  width: 230,
                                  height: 300,
                                  child: GestureDetector(
                                    child: ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10.0,
                                          sigmaY: 10.0,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200]
                                                  ?.withOpacity(0.1),
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.grey)),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                          width: 200,
                                                          height: 150,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    "${entry["picture"]}"),
                                                                fit: BoxFit
                                                                    .cover),
                                                          )),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '${entry["title1"]}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: const TextStyle(
                                                                  color: Color(
                                                                      0xFFBC4E9C),
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      'BlackChancery'),
                                                            ),
                                                            Text(
                                                              '${entry["title"]}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20,
                                                                  fontFamily:
                                                                      'BlackChancery'),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '${entry["title2"]}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'BlackChancery'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                back: (entry["Event1"].toString() != "" ||
                                        entry["Event2"].toString() != "" ||
                                        entry["Event3"].toString() != "" ||
                                        entry["Event4"].toString() != "" ||
                                        entry["details"].toString() != "")
                                    ? Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 3, 10, 30),
                                        width: 230,
                                        height: 300,
                                        child: GestureDetector(
                                          child: ClipRect(
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200]
                                                        ?.withOpacity(0.1),
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Colors.grey)),
                                                child: Center(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${entry["title1"]}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .right,
                                                                style: const TextStyle(
                                                                    color: Color(
                                                                        0xFFBC4E9C),
                                                                    fontSize:
                                                                        20,
                                                                    fontFamily:
                                                                        'BlackChancery'),
                                                              ),
                                                              Text(
                                                                '${entry["title"]}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontFamily:
                                                                        'BlackChancery'),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            '${entry["title2"]}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'BlackChancery'),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                8, 10, 8, 0),
                                                        child: Text(
                                                          '${entry["details"]}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${entry["Event1"]}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFFBC4E9C),
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Quintessential'),
                                                      ),
                                                      Text(
                                                        '${entry["Event2"]}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFFBC4E9C),
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Quintessential'),
                                                      ),
                                                      Text(
                                                        '${entry["Event3"]}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFFBC4E9C),
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Quintessential'),
                                                      ),
                                                      Text(
                                                        '${entry["Event4"]}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xFFBC4E9C),
                                                            fontSize: 10,
                                                            fontFamily:
                                                                'Quintessential'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                ],
              ))
        ]);
  }
}

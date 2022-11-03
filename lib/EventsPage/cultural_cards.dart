import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cssapp/configs/configs.dart';

class Culturalcards extends StatelessWidget {
  var events = [
    {
      "title1": "O",
      "title": "RIENTATION",
      "picture": Paths.eventTIMGOrientation,
      "details":
          "A weekend full of fun and coding events for freshers to interact and get to know their batchmates, seniors and competitors.",
      "Event1": "Chess",
      "Event2": "Valo",
      "Event3": "Meme competition",
      "Event4": "Article writing",
    },
    {
      "title1": "C",
      "title": "S-GO",
      "picture": Paths.eventTIMGCSGo,
      "details": "Fun and Gaming events",
      "Event1": "Chess",
      "Event2": "Valorant Tournaments",
      "Event3": "Scrible",
      "Event4": "General Quiz",
    },
    {
      "title1": "F",
      "title": "RESHERS",
      "picture": Paths.eventTIMGFreshers,
      "details":
          "Hey there, get ready, it’s the Freshers, it’s the Esperanza! The event that excites every first-year guy and girl. The main aim of this party is to give a warm welcome to the new comers. It is accompanied with so many colourful events and programs and splendid decoration, thus making it a soulful evening.",
      "Event1": "",
      "Event2": "",
      "Event3": "",
      "Event4": "",
    },
    {
      "title1": "F",
      "title": "AREWELL",
      "picture": Paths.eventTIMGFarewell,
      "details":
          "Some day and at some time, we need to bid farewell to the special and loving ones in our life. Our senior friends, although not blood-related, are special people in our lives and bidding farewell might be a painful moment as we will be missing them. As they need to say goodbye, we make it worth remembering for them by bidding them some encouraging farewell messages and memories through the farewell event, which is conducted at the end of every year session.",
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
              child: Stack(children: [
                Stack(children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: LottieBuilder.asset(
                          Paths.lottieLoader,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: LottieBuilder.asset(
                          Paths.lottieLoader,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: LottieBuilder.asset(
                          Paths.lottieLoader,
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
                              padding: const EdgeInsets.fromLTRB(10, 3, 10, 30),
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
                                              width: 0.5, color: Colors.grey)),
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
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    width: 150,
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "${entry["picture"]}"),
                                                          fit: BoxFit.cover),
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
                                                            TextAlign.right,
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            back: Container(
                              padding: const EdgeInsets.fromLTRB(10, 3, 10, 30),
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
                                              width: 0.5, color: Colors.grey)),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${entry["title1"]}',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xFFBC4E9C),
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'BlackChancery'),
                                                    ),
                                                    Text(
                                                      '${entry["title"]}',
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 10, 8, 0),
                                              child: Text(
                                                '${entry["details"]}',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ),
                                            Text(
                                              '${entry["Event1"]}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xFFBC4E9C),
                                                  fontSize: 10,
                                                  fontFamily: 'Quintessential'),
                                            ),
                                            Text(
                                              '${entry["Event2"]}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xFFBC4E9C),
                                                  fontSize: 10,
                                                  fontFamily: 'Quintessential'),
                                            ),
                                            Text(
                                              '${entry["Event3"]}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xFFBC4E9C),
                                                  fontSize: 10,
                                                  fontFamily: 'Quintessential'),
                                            ),
                                            Text(
                                              '${entry["Event4"]}',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Color(0xFFBC4E9C),
                                                  fontSize: 10,
                                                  fontFamily: 'Quintessential'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ])
              ]))
        ]);
  }
}

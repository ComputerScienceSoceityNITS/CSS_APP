// ignore: avoid_web_libraries_in_flutter

import 'package:cssapp/screens/home_screen/pages/EventsPage/cards/abacus_cards.dart';
// import 'package:cssapp/screens/home_screen/pages/EventsPage/engima.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/enigma.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/abacus_text.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/enigma_text.dart';
import 'package:lottie/lottie.dart';

import 'cards/techno_cards.dart';
import 'cards/cultural_cards.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'widgets/widgets.dart';
import 'abacus.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  ScrollController scroll = ScrollController();
  bool technoEventsSelected = true;
  bool culturaleventsselected = false;
  bool abacuseventselected = false;
  bool isExpanded = false;
  // bool isselected = false;

  int index = 0;
  int colorindex = 0;
  int boldindex = 1;
  List<dynamic> bold = [FontWeight.bold, FontWeight.normal];
  List<dynamic> color = [
    Pallet.accentColor,
  ];
  List<dynamic> cards = [
    TechnoCards.cards,
    CulturalCards.cards,
    AbacusCards.cards
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          controller: scroll,
          children: [
            const Stack(
              alignment: Alignment.topCenter,
              children: [
                AccountingAnimation(),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      CSSText(),
                      EventText(),
                      TagText(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnigmaPage(),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          child: Image.asset(
                            "assets/images/event_thumbnails/enigmaa.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                          height: MediaQuery.of(context).size.height * 0.26,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        elevation: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AbacusPage(),
                            ));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(20),
                        child: Container(
                          child: Image.asset(
                            "assets/images/event_thumbnails/abacus.png",
                            fit: BoxFit.cover,
                          ),
                          height: MediaQuery.of(context).size.height * 0.26,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        elevation: 20,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [EnigmaText(), AbacusText()],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: isExpanded
                    ? technoEventsSelected
                        ? 3658.0
                        : 1720
                    : 70, // Set the height according to the state of isExpanded
                color: Colors.transparent,
                child: isExpanded == true
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.08),
                                GestureDetector(
                                  onTap: () => setState(() {
                                    technoEventsSelected = true;
                                    culturaleventsselected = false;
                                    abacuseventselected = false;

                                    index = 0;
                                    // isselected = true;
                                  }),
                                  child: Text(
                                    "Techno Events",
                                    style: TextStyle(
                                      fontFamily: "Cormorant Unicase",
                                      fontSize: 18,
                                      fontWeight: technoEventsSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: technoEventsSelected
                                          ? Pallet.accentColor
                                          : Theme.of(context).colorScheme.background,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.07),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      technoEventsSelected = false;
                                      culturaleventsselected = true;
                                      abacuseventselected = false;
                                      index = 1;
                                    });
                                  },
                                  child: Text(
                                    "Cultural Events",
                                    style: TextStyle(
                                      fontFamily: "Cormorant Unicase",
                                      fontSize: 18,
                                      fontWeight: culturaleventsselected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: culturaleventsselected
                                          ? Pallet.accentColor
                                          : Theme.of(context).colorScheme.background,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Events(cards: cards[index]),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: SizedBox(
                          height: 100,
                          child: Lottie.asset(
                              "assets/lottie/scrolldownarrow.json"),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

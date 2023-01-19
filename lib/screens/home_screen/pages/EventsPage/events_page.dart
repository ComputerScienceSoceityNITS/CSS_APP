// ignore: avoid_web_libraries_in_flutter

import 'package:cssapp/screens/home_screen/pages/EventsPage/cards/abacus_cards.dart';

import 'cards/techno_cards.dart';
import 'cards/cultural_cards.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'widgets/widgets.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool technoEventsSelected = true;
  bool culturaleventsselected = false;
  bool abacuseventselected = false;
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
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const AccountingAnimation(),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        children: const [
                          CSSText(),
                          EventText(),
                          TagText(),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
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
                          fontSize: 15,
                          fontWeight: technoEventsSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: technoEventsSelected
                              ? Pallet.accentColor
                              : Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
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
                          fontSize: 15,
                          fontWeight: culturaleventsselected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: culturaleventsselected
                              ? Pallet.accentColor
                              : Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    GestureDetector(
                      onTap: () => setState(() {
                        culturaleventsselected = false;
                        abacuseventselected = true;
                        technoEventsSelected = false;

                        index = 2;
                      }),
                      child: Text(
                        "Abacus",
                        style: TextStyle(
                          fontFamily: "Cormorant Unicase",
                          fontSize: 15,
                          fontWeight: abacuseventselected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: abacuseventselected
                              ? Pallet.accentColor
                              : Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      children: [
                        Events(cards: cards[index]),

                        // technoEventsSelected
                        //     ? Offstage(
                        //         offstage: technoEventsSelected == false,
                        //         child: Events(
                        //             cards: TechnoCards.cards,
                        //             lottie: Assets.lottieTechno),
                        //       )
                        //     : Offstage(
                        //         offstage: technoEventsSelected == true,
                        //         child: Events(
                        //             cards: CulturalCards.cards,
                        //             lottie: Assets.lottieTechno),
                        //       ),

                        //  Offstage(
                        //     offstage: technoEventsSelected == true,
                        // child: Events(
                        //     cards: CulturalCards.cards,
                        //     lottie: Assets.lottieLoader),
                        //   ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

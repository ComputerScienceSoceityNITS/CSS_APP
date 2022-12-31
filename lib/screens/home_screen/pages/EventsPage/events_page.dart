import 'package:cssapp/utils/storage_handler.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
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
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                ),
          SingleChildScrollView(
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
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: () => setState(() {
                          technoEventsSelected = true;
                        }),
                        child: Text(
                          "Techno Events",
                          style: textStylisedCormorantSmall.copyWith(
                            color: technoEventsSelected
                                ? Pallet.accentColor
                                : Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      GestureDetector(
                        onTap: () => setState(() {
                          technoEventsSelected = false;
                        }),
                        child: Text(
                          "Cultural Events",
                          style: textStylisedCormorantSmall.copyWith(
                            color: !technoEventsSelected
                                ? Pallet.accentColor
                                : Theme.of(context).backgroundColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  technoEventsSelected
                      ? Offstage(
                          offstage: technoEventsSelected == false,
                          child: Events(
                              cards: TechnoCards.cards,
                              lottie: Assets.lottieTechnoGif),
                        )
                      : Offstage(
                          offstage: technoEventsSelected == true,
                          child: Events(
                              cards: CulturalCards.cards,
                              lottie: Assets.lottieLoaderGif),
                        ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

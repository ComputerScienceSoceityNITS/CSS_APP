import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'event.dart';

class Events extends StatelessWidget {
  static final List<Event> events = [
    Event(
      title: "ESPERANZA",
      desc:
          "The event that excites every first-year guy and girl, which not only build their confidence but also add creativity to their levels. The main aim of this party is to give a warm welcome to the new comers. It is accompanied with so many colourful events and programs like ramp walk, traditional, fusion, and western dances, exhilarating singing performances, and splendid decoration, thus making it a soulful evening.",
      img: Assets.bgMusicController,
    ),
    Event(
      title: "ENIGMA",
      desc:
          "Computer Science Society organizes coding contests for first year students. This contest being open to all enhances a good competitive environment for the students. The questions are made such that even students will little or basic Knowledge of programming can surely attempt the questions. Learning programming is now an essential skill for various placement interviews and our society encourages more and more participation in such activities",
      img: Assets.bgCode,
    ),
    Event(
      title: "ABACUS",
      desc:
          "The annual Computer Science and Engineering week - ABACUS! The excitement begins each year, for the Annual week of the CSE department in which different games and competitions takes place where everyone gets a cool opportunity to prove their skills down and claim the prize money.But the most unique point about it is that it gives you, the freshers, the opportunity to become organizers, to present your ideas, instead of just participating and enables you to learn numerous things.",
      img: Assets.bgAbacus,
      link: "https://www.facebook.com/csenitsabacus",
    ),
    Event(
        title: "BITSCRIBE",
        desc:
            "Every year, the Computer Science society excels in doing something new and innovative. It doesn’t remain dormant. The newsletter ‘bitscribe’ is a recent gift for the students of NIT Silchar from the society.It consists of articles by alumni as well as the current students of CSE which are full of motivation and knowledge. The newsletter requires a lot of effort and unity which shows the potential and efforts of the society.Whatever the society does, it never compromises with quality!",
        img: Assets.bgMagazine,
        link:
            "https://issuu.com/bitscribe/docs/bitscribe_1_?fbclid=IwAR3WTcvsRco6gI-enMchIkBfhzKInZIgliMYlxi-TLOb1SxVK_7-sH7mJyQ"),
    Event(
        title: "LIT WEEK",
        desc:
            "The annual Computer Science and Engineering week - Abacus, is right around the corner.” Yeah, this is how the excitement begins each year, for the Annual week of the CSE dept. in which different games and competitions takes place where everyone gets a cool opportunity to prove their skills down and claim the prize money.But the most unique point about it is that it gives you, the freshers, the opportunity to become organizers, to present your ideas, instead of just participating and enables you to learn numerous things.",
        img: Assets.bgFlower,
        link: "https://www.facebook.com/CSS.NITSilchar")
  ];

  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: events.map((event) {
      return event;
    }).toList());
  }
}

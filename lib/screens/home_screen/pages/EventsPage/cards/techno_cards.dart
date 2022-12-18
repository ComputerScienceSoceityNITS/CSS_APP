import 'dart:ui';
import '../widgets/event.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cssapp/configs/configs.dart';

class TechnoCards {
  static final List<Event> cards = [
    Event(
      stylisedChar: "A",
      title: "BACUS",
      titleLine2: "TECH",
      thumbnail: Assets.eventTIMGAbacusTech,
      events: const ["Chess", "Valo", "Meme competition", "Article writing"],
      addBorderRadiusToThumbnail: false,
    ),
    Event(
      stylisedChar: "A",
      title: "BACUS",
      titleLine2: "IIT",
      thumbnail: Assets.eventTIMGAbacusIIT,
      events: const [
        "Chess",
        "Valorant Tournaments",
        "Scrible",
        "General Quiz"
      ],
      addBorderRadiusToThumbnail: false,
    ),
    Event(
      stylisedChar: "C",
      title: "SS",
      titleLine2: "HACKS",
      thumbnail: Assets.eventTIMGCSSHacks,
      details:
          "An amazing hackathon for developers and dev enthusiasts solving problems given by the judges. This is the one big opportunity for all the hackathon lovers to check their innovative and presentation skills. This provides the participants a upperhand experience for all the hackathon they will be participating in.",
      events: const [],
      addBorderRadiusToThumbnail: false,
    ),
    Event(
      stylisedChar: "E",
      title: "NIGMA",
      thumbnail: Assets.eventTIMGEnigma,
      details:
          "Computer Science Society organizes coding contests for first year students. This contest being open to all enhances a good competitive environment for the students. The questions are made such that even students will little or basic Knowledge of programming can surely attempt the questions. Learning programming is now an essential skill for various placement interviews and our society encourages more and more participation in such activities.",
      events: const [],
      addBorderRadiusToThumbnail: false,
    ),
    Event(
      stylisedChar: "C",
      title: "CLASSES",
      thumbnail: Assets.eventTIMGCClasses,
      details:
          "Basics of programming and C language is taught by the computer science students of second year in order to enlighten the first year students about the resources to study tips and tricks to move ahead in terms of fundamentals and knowledge about Computer Science.",
      events: const [],
      addBorderRadiusToThumbnail: false,
    ),
  ];
}

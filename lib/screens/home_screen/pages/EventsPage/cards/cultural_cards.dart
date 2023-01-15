import 'package:cssapp/configs/configs.dart';
import '../widgets/event.dart';

class CulturalCards {
  static final List<Event> cards = [
    Event(
      stylisedChar: "O",
      title: "rientation",
      thumbnail: Assets.eventTIMGOrientation,
      imagepath: "assets/images/event_thumbnails/orientation.jpg",
      details:
          "The CSS organizes the official society orientation programme each year for the fresher batch. The program aims to make the students aware of the wide range of opportunities, events and programmes that society offers. It introduces the freshers to the various divisions and initiatives of the society .",
      events: const [
        //"Chess", "Valo", "Meme competition", "Article writing"
      ],
    ),
    Event(
      stylisedChar: "F",
      title: "arewellL",
      thumbnail: Assets.eventTIMGFarewell,
      imagepath: "assets/images/event_thumbnails/farewell.jpg",
      details:
          "CSS organizes the farewell programme each year to bid adieu to the senior cse batch of the institute. The objective of the program is to provide the seniors with a platform to relish and relive the joyous moments of their college lives and to honor their contributions to the institute and the student body.",
      events: const [],
    ),
    Event(
      stylisedChar: "E",
      title: "sperenza",
      thumbnail: Assets.eventTIMGFreshers,
      imagepath: "assets/images/event_thumbnails/esperenza.jpeg",
      details:
          "Hey there, get ready, it’s the Freshers, it’s the Esperanza! The event that excites every first-year guy and girl. The main aim of this party is to give a warm welcome to the new comers. It is accompanied with so many colourful events and programs and splendid decoration, thus making it a soulful evening.",
      events: const [],
    ),
    Event(
      stylisedChar: "C",
      title: "S-GO",
      thumbnail: Assets.eventTIMGCSGo,
      details:
          "Being part of the Computer Science Society and it’s legacy is an honour in no small sense.CSS organizes a plethora of fun events to commemorate the formation of society each year.The event is exclusively for second years CSE students and is organized by the second-year wing members themselves.",
      imagepath: "assets/images/event_thumbnails/cs-go.jpg",
      events: const [
        // "Chess",
        // "Valorant Tournaments",
        // "Scrible",
        // "General Quiz",
      ],
    ),
    Event(
      stylisedChar: "C",
      title: "SS Olympics",
      thumbnail: Assets.eventTIMGCSGo,
      details:
          "CSS Olympics is the annual sports week conducted by the Computer Science Society and garners participation from all CSE batches. It provides a platform for the students to demonstrate their athletic abilities while participating in a wide range of sporting activities.",
      imagepath: "assets/images/event_thumbnails/cssolympics.jpeg",
      events: const [
        //"Contrary to public view, CSE students do in fact touch grass. CSS Olympics is the annual sports week conducted by the Computer Science Society and garners participation from all CSE batches. It provides a platform for the students to demonstrate their athletic abilities while participating in a wide range of sporting activities. ",
      ],
    ),
  ];
}

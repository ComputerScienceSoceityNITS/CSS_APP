import 'package:flutter/cupertino.dart';

import '../widgets/event.dart';
import 'package:cssapp/configs/configs.dart';

class TechnoCards {
  static final List<Event> cards = [
    Event(
      stylisedChar: "I",
      title: "nspire Room",
      //titleLine2: "session",
      thumbnail: Assets.speakersession,
      imagepath: "assets/images/event_thumbnails/speakersession.jpeg",
      // events: const [
      //   "Chess",
      //   "Valorant Tournaments",
      //   "Scrible",
      //   "General Quiz"
      // ],
      events: const [],
      details:
          "The Computer Science Society organizes numerous speaker sessions throughout the course of the year featuring techies from across the country.Having proved their mettle in varied advancing domains in the realm of computational sciences, the words of guidance from the speakers target to ignite within the students a sense of zeal and initiative as they strive forward in their respective fields. The PR wing of the CSS organizes these sessions.",
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "E",
      title: "nigma/",
      titleLine2: "Enigma+",
      imagepath: "assets/images/event_thumbnails/Enigma.png",
      thumbnail: Assets.enigma,
      events: const [
        // "Chess",
        // "Valorant Tournaments",
        // "Scrible",
        // "General Quiz"
      ],
      details:
          "Having established a trail of success stories with NIT Silchar CSE students and alumni being placed in top companies around the globe, the CSS of NIT Silchar understands the importance of competitive programming and its role in cracking international hackathons and MNCs. Enigma is a weekly coding contest organized by the CP wing aimed to make the students comfortable with the level and format of such questions and to provide them with a competitive edge in their endeavors.",
      addBorderRadiusToThumbnail: false,
    ),
    Event(
      stylisedChar: "C",
      title: " Classes",
      //titleLine2: "IIT",
      thumbnail: Assets.cclasses,
      imagepath: "assets/images/event_thumbnails/C-classes.png",
      events: const [
        // "Chess",
        // "Valorant Tournaments",
        // "Scrible",
        // "General Quiz"
      ],
      details:
          "Every year CSS organizes introductory to advanced-level classes in c programming for freshers which are taken by the cse sophomores themselves. The aim of the programme is to provide the students with a mentor who has followed the same path as themselves and can acknowledge and resolve the problems and struggles faced by the freshers as they gear up to pursue their careers in tech.",
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "D",
      title: "ev",
      titleLine2: "Workshop",
      imagepath: "assets/images/event_thumbnails/devworkshop.png",
      thumbnail: Assets.devworkshop,
      // thumbnail,
      events: [
        // "Chess",
        // "Valorant Tournaments",
        // "Scrible",
        // "General Quiz"
      ],
      details:
          "CSS organizes numerous development workshops throughout the course of the year which are conducted by the dev wing. The objective of the workkshops is to help the students navigate through the challenging and mind-numbing concepts of fields like app dev, web dev, web3, etc and to provide them with a competitive edge in the corporate world.",
      addBorderRadiusToThumbnail: true,
    ),
    // Event(
    //   stylisedChar: "A",
    //   title: "BACUS",
    //   // titleLine2: "TECH",
    //   thumbnail: Assets.abacus,
    //   imagepath: "assets/images/event_thumbnails/abacus.png",
    //   events: const [
    //     // "Chess", "Valo", "Meme competition", "Article writing"
    //   ],
    //   details:
    //       "Abacus is a one-week-long event organized by the CSS. The event garners participation from all CSE batches in the institute and comprises a plethora of exciting events like CSS wars, CSS hacks and many more. The event aims to provide a stress free week of fun for students to interact with each other, compete with their mates and win exciting prizes",
    //   addBorderRadiusToThumbnail: true,
    // ),
    // Event(
    //   stylisedChar: "A",
    //   title: "BACUS",
    //   titleLine2: "IIT",
    //   thumbnail: Assets.eventTIMGAbacusIIT,
    //   events: const [
    //     "Chess",
    //     "Valorant Tournaments",
    //     "Scrible",
    //     "General Quiz"
    //   ],
    //   addBorderRadiusToThumbnail: false,
    // ),
    Event(
      stylisedChar: "M",
      title: "L Session",
      // titleLine2: "HAC",
      thumbnail: Assets.mlclasses,
      imagepath: "assets/images/event_thumbnails/mlclasses.jpeg",
      details:
          "Machine Learning is one of the fastest-growing domains in computer science with several applications in data analytics and leverage that to improve the extent and quality of performance in fields like A.I. The ML wing of CSS organizes ML sessions on a regular basis to mentor students and help them advance in the field and pursue a career in it.",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "C",
      title: "SS Hacks",
      thumbnail: Assets.csshacks,
      imagepath: "assets/images/event_thumbnails/CSS-hack.png",
      details:
          "Conducted under the banner of Abacus by the dev wing, CSS Hacks as the name suggests is an annual hackathon. The hackathon caters to the participants with a series of intriguing and complicated problems as they compete with their peers for exciting prizes.",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "C",
      title: "SS Wars",
      thumbnail: Assets.csswars,
      imagepath: "assets/images/event_thumbnails/csswars.jpeg",
      details:
          "Web design is one of the most sought out fields in computer science. CSS wars is conducted under the banner of Abacus by the dev wing and is an annual web development competition aimed at testing the prowess of the participants in HTML, CSS and Javascript.",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
  ];
}

import 'package:flutter/cupertino.dart';

import '../widgets/event.dart';
import 'package:cssapp/configs/configs.dart';

class TechnoCards {
  static final List<Event> cards = [
    Event(
      stylisedChar: "I",
      title: "nspire Room",
      thumbnail: Assets.speakersession,
      imagepath: "assets/images/event_thumbnails/speakersession.jpeg",
      events: const [],
      details:
          "The Computer Science Society organizes numerous speaker sessions throughout the course of the year featuring techies from across the country.Having proved their mettle in varied advancing domains in the realm of computational sciences, the words of guidance from the speakers target to ignite within the students a sense of zeal and initiative as they strive forward in their respective fields. The PR wing of the CSS organizes these sessions.",
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "C",
      title: " Classes",
      thumbnail: Assets.cclasses,
      imagepath: "assets/images/event_thumbnails/C-classes.png",
      events: const [],
      details:
          "Every year CSS organizes introductory to advanced-level classes in c programming for freshers which are taken by the cse sophomores themselves. The aim of the programme is to provide the students with a mentor who has followed the same path as themselves and can acknowledge and resolve the problems and struggles faced by the freshers as they gear up to pursue their careers in tech.",
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "E",
      title: "nigma/",
      titleLine2: "Enigma+",
      imagepath: "assets/images/event_thumbnails/Enigma.png",
      thumbnail: Assets.enigma,
      events: const [],
      details:
          "Having established a trail of success stories with NIT Silchar CSE students and alumni being placed in top companies around the globe, the CSS of NIT Silchar understands the importance of competitive programming and its role in cracking international hackathons and MNCs. Enigma is a weekly coding contest organized by the CP wing aimed to make the students comfortable with the level and format of such questions and to provide them with a competitive edge in their endeavors.",
      addBorderRadiusToThumbnail: false,
    ),
    Event(
      stylisedChar: "D",
      title: "evelopment",
      titleLine2: "Workshop",
      imagepath: "assets/images/event_thumbnails/devworkshop.png",
      thumbnail: Assets.devworkshop,
      events: const [],
      details:
          "CSS organizes numerous development workshops throughout the course of the year which are conducted by the dev wing. The objective of the workkshops is to help the students navigate through the challenging and mind-numbing concepts of fields like app dev, web dev, web3, etc and to provide them with a competitive edge in the corporate world.",
      addBorderRadiusToThumbnail: true,
    ),
    // Event(
    //   stylisedChar: "D",
    //   title: "SA",
    //   titleLine2: "Marathon",
    //   thumbnail: Assets.dsaMarathon,
    //   imagepath: "",
    //   events: const [],
    //   details:
    //       "The Computer Science Society organizes DSA marathon events to help the students improve their DSA skills which can help them in their carrer and improve their coding skills as well as in creating a competetive enviornment among the students",
    //   addBorderRadiusToThumbnail: true,
    // ),
    // Event(
    //   stylisedChar: "D",
    //   title: "esign",
    //   titleLine2: "Workshop",
    //   thumbnail: Assets.dsaMarathon,
    //   imagepath: "",
    //   events: const [],
    //   details:
    //       "The Computer Science Society organizes DSA marathon events to help the students improve their DSA skills which can help them in their carrer and improve their coding skills as well as in creating a competetive enviornment among the students",
    //   addBorderRadiusToThumbnail: true,
    // ),
    // Event(
    //   stylisedChar: "M",
    //   title: "L Project",
    //   titleLine2: "Showcase",
    //   thumbnail: Assets.dsaMarathon,
    //   imagepath: "",
    //   events: const [],
    //   details:
    //       "The Computer Science Society organizes DSA marathon events to help the students improve their DSA skills which can help them in their carrer and improve their coding skills as well as in creating a competetive enviornment among the students",
    //   addBorderRadiusToThumbnail: true,
    // ),
    // Event(
    //   stylisedChar: "M",
    //   title: "L Project",
    //   titleLine2: "Showcase",
    //   thumbnail: Assets.devworkshop,
    //   imagepath: "",
    //   events: const [],
    //   details:
    //       "The Computer Science Society organizes DSA marathon events to help the students improve their DSA skills which can help them in their carrer and improve their coding skills as well as in creating a competetive enviornment among the students",
    //   addBorderRadiusToThumbnail: true,
    // ),
    // Event(
    //   stylisedChar: "O",
    //   title: "penSourc",
    //   titleLine2: "Hackathon",
    //   imagepath: "assets/images/event_thumbnails/hackathon.jpeg",
    //   thumbnail: Assets.hackathon,
    //   events: const [],
    //   details:
    //       "The Computer Science Society organizes hackathons throughout the course of the year which are open source. It’s a great opportunity to get to know others that have the same interests  and it is a great add up to your CV",
    //   addBorderRadiusToThumbnail: true,
    // ),
    // Event(
    //   stylisedChar: "M",
    //   title: "L Project",
    //   titleLine2: "Showcase",
    //   thumbnail: Assets.mlclasses,
    //   imagepath: "assets/images/event_thumbnails/mlclasses.jpeg",
    //   details:
    //       "Machine Learning is one of the fastest-growing domains in computer science with several applications in data analytics and leverage that to improve the extent and quality of performance in fields like A.I. The ML wing of CSS organizes ML sessions on a regular basis to mentor students and help them advance in the field and pursue a career in it.",
    //   events: const [],
    //   addBorderRadiusToThumbnail: true,
    // ),
    Event(
      stylisedChar: "M",
      title: "L Classes",
      // titleLine2: "",
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
    Event(
      stylisedChar: "M",
      title: "L Project",
      titleLine2: "Showcase",
      thumbnail: Assets.mlProjectShowcase,
      imagepath: "assets/images/event_thumbnails/csswars.jpeg",
      details:
          "The Computer Science Society organizes ML Project Showcase to given an insight to the world of Machine Learning.",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "D",
      title: "SA Marathon",
      thumbnail: Assets.dsaMarathon,
      imagepath: "assets/images/event_thumbnails/csswars.jpeg",
      details:
          "The Computer Science Society organizes DSA marathon events to help the students improve their DSA skills which can help them in their carrer and improve their coding skills as well as in creating a competetive enviornment among the students",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "O",
      title: "pen Source",
      titleLine2: "Hackathon",
      thumbnail: Assets.oshacathon,
      imagepath: "assets/images/event_thumbnails/csswars.jpeg",
      details:
          "The Computer Science Society organizes hackathons throughout the course of the year which are open source. It’s a great opportunity to get to know others that have the same interests  and it is a great add up to your CV.",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
    Event(
      stylisedChar: "D",
      title: "esign",
      titleLine2: "Workshop",
      thumbnail: Assets.designW,
      imagepath: "assets/images/event_thumbnails/csswars.jpeg",
      details:
          "The Computer Science Society origanizes Design Workshops which are interactive learning experiences that help participants develop creative problem solving skills and gain insight into the design process.",
      events: const [],
      addBorderRadiusToThumbnail: true,
    ),
  ];
}

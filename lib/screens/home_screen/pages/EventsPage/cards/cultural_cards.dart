import 'package:cssapp/configs/configs.dart';
import '../widgets/event.dart';

class CulturalCards {
  static final List<Event> cards = [
    Event(
      stylisedChar: "O",
      title: "RIENTATION",
      thumbnail: Assets.eventTIMGOrientation,
      details:
          "A weekend full of fun and coding events for freshers to interact and get to know their batchmates, seniors and competitors.",
      events: const ["Chess", "Valo", "Meme competition", "Article writing"],
    ),
    Event(
      stylisedChar: "C",
      title: "S-GO",
      thumbnail: Assets.eventTIMGCSGo,
      details: "Fun and Gaming events",
      events: const [
        "Chess",
        "Valorant Tournaments",
        "Scrible",
        "General Quiz",
      ],
    ),
    Event(
      stylisedChar: "F",
      title: "RESHERS",
      thumbnail: Assets.eventTIMGFreshers,
      details:
          "Hey there, get ready, it’s the Freshers, it’s the Esperanza! The event that excites every first-year guy and girl. The main aim of this party is to give a warm welcome to the new comers. It is accompanied with so many colourful events and programs and splendid decoration, thus making it a soulful evening.",
      events: const [],
    ),
    Event(
      stylisedChar: "F",
      title: "AREWELL",
      thumbnail: Assets.eventTIMGFarewell,
      details:
          "Some day and at some time, we need to bid farewell to the special and loving ones in our life. Our senior friends, although not blood-related, are special people in our lives and bidding farewell might be a painful moment as we will be missing them. As they need to say goodbye, we make it worth remembering for them by bidding them some encouraging farewell messages and memories through the farewell event, which is conducted at the end of every year session.",
      events: const [],
    )
  ];
}

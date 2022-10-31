import 'package:flutter/material.dart';
import 'package:cssapp/EventsPage/techno_cards.dart';

class TechnoEvents extends StatefulWidget {
  const TechnoEvents({Key? key}) : super(key: key);

  @override
  _TechnoEventsState createState() => _TechnoEventsState();
}

class _TechnoEventsState extends State<TechnoEvents> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Technocards(),
    );
  }
}

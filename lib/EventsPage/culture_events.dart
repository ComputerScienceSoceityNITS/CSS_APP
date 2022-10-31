import 'package:flutter/material.dart';
import 'package:cssapp/EventsPage/cultural_cards.dart';

class CultureEvents extends StatelessWidget {
  const CultureEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: Culturalcards(),
    );
  }
}

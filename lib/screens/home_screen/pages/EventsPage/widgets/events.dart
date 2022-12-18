import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'event.dart';
import 'package:cssapp/configs/configs.dart';

class Events extends StatefulWidget {
  final List<Event> cards;
  final Widget lottie;

  const Events({Key? key, required this.cards, required this.lottie})
      : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
          height: (320 * widget.cards.length).toDouble(),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.cards,
          )),
    );
  }
}

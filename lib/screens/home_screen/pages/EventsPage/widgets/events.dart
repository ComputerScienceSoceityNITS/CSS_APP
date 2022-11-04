import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'event.dart';

class Events extends StatefulWidget {
  final List<Event> cards;
  final LottieBuilder lottie;
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Wrap(
            direction: Axis.vertical,
            spacing: 100,
            children: [
              for (int i = 0; i < widget.cards.length; i++)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: LottieBuilder(
                    lottie: widget.lottie.lottie,
                    fit: BoxFit.fitWidth,
                  ),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.cards,
          )
        ],
      ),
    );
  }
}

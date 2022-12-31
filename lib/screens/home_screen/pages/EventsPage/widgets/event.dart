import 'dart:ui';

import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Event extends StatelessWidget {
  final String? stylisedChar;
  final String title;
  final String? titleLine2;
  final Image thumbnail;
  final String? details;
  final List<String> events;
  final bool addBorderRadiusToThumbnail;
  const Event(
      {Key? key,
      this.stylisedChar,
      required this.title,
      this.titleLine2,
      required this.thumbnail,
      this.details,
      required this.events,
      this.addBorderRadiusToThumbnail = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> eventTitle = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Offstage(
            offstage: stylisedChar == null,
            child: Text(
              stylisedChar ?? '',
              textAlign: TextAlign.right,
              style: textStylisedBlackChancerySmall.copyWith(
                  color: Pallet.accentColor),
            ),
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: textStylisedBlackChancerySmall.copyWith(
                  color: Theme.of(context).backgroundColor)),
        ],
      ),
      const SizedBox(width: 10),
      Offstage(
        offstage: titleLine2 == null,
        child: Text(
          titleLine2 ?? '',
          textAlign: TextAlign.center,
          style: textStylisedBlackChancerySmall.copyWith(
              color: Theme.of(context).backgroundColor),
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FlipCard(
        fill: Fill.fillBack,
        front: _BaseCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: addBorderRadiusToThumbnail ? 150 : 200,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: thumbnail.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: addBorderRadiusToThumbnail ? 20 : 10),
              Column(
                children: eventTitle,
              )
            ],
          ),
        ),
        back: _BaseCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: eventTitle,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Text(
                  details ?? '',
                  textAlign: TextAlign.center,
                  // style: const TextStyle(color: Colors.white, fontSize: 10),
                  style: textSmall.copyWith(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 10,
                  ),
                ),
              ),
              ...events.map(
                (event) => Text(
                  event,
                  textAlign: TextAlign.center,
                  style: textStylisedQuintessentialSmall.copyWith(
                      color: Pallet.accentColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Widget child;
  const _BaseCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          width: 230,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.1),
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
          child: child,
        ),
      ),
    );
  }
}

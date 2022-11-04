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
              style: textStylisedBlackChancerySmall),
        ],
      ),
      const SizedBox(width: 10),
      Offstage(
        offstage: titleLine2 == null,
        child: Text(
          titleLine2 ?? '',
          textAlign: TextAlign.center,
          style: textStylisedBlackChancerySmall,
        ),
      ),
    ];
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        padding: const EdgeInsets.fromLTRB(10, 3, 10, 30),
        width: 230,
        height: 300,
        child: GestureDetector(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200]?.withOpacity(0.1),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: addBorderRadiusToThumbnail == true
                                  ? 150
                                  : double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    addBorderRadiusToThumbnail == true
                                        ? 100
                                        : 0),
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                    image: thumbnail.image, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(children: eventTitle)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      back: (details != null && details!.isNotEmpty) || events.isNotEmpty
          ? Container(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 30),
              width: 230,
              height: 300,
              child: GestureDetector(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200]?.withOpacity(0.1),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: eventTitle),
                            Offstage(
                              offstage: details == null,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                                child: Text(
                                  details ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            ...events
                                .map(
                                  (String event) => Text(
                                    event,
                                    textAlign: TextAlign.center,
                                    style: textStylisedQuintessentialSmall
                                        .copyWith(color: Pallet.accentColor),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

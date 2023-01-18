import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import '../events/events.dart';

class AboutUs extends StatelessWidget {
  final double gap;
  const AboutUs({Key? key, required this.gap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: min(MediaQuery.of(context).size.width * 0.9, 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1.5),
        gradient: LinearGradient(
          colors: Theme.of(context).brightness == Brightness.dark
              ? [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.2),
                ]
              : [
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.05)
                ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: Theme.of(context).brightness == Brightness.dark
                ? [Colors.blue, Colors.transparent]
                : [Colors.transparent, Colors.transparent],
            center: const Alignment(0, -0.5),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: gap),
            Text('ABOUT US',
                style: textLarge.copyWith(
                    color: Theme.of(context).backgroundColor)),
            SizedBox(height: gap),
            SizedBox(
              width: 300,
              child: Text(
                "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. Computer Science Engineering branch of NIT Silchar stands with the highest number of placements and talented minds.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.3, color: Theme.of(context).backgroundColor),
              ),
            ),
            const SizedBox(height: 80),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Events(),
            )
          ],
        ),
      ),
    );
  }
}

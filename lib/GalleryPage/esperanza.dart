import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Esperanza extends StatefulWidget {
  @override
  State<Esperanza> createState() => _EsperanzaState();
}

class _EsperanzaState extends State<Esperanza> {
  final esperanza_pics = [
    "assets/3-min.jpeg",
    "assets/1-min.jpeg",
    "assets/2-min.jpeg",
    "assets/4-min.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(children: [
      SizedBox(
        width: _size.width,
        child: LottieBuilder.asset(
          'assets/loader.json',
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: esperanza_pics.length,
              itemBuilder: (context, index, realIndex) {
                final esperanzaPic = esperanza_pics[index];
                return buildImage(esperanzaPic, index);
              },
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height * 0.4))),
    ]);
  }

  Widget buildImage(String esperanzaPic, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.blue,
        child: Image.asset(
          esperanzaPic,
          fit: BoxFit.cover,
        ),
      );
}

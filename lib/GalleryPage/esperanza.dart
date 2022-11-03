import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';

class Esperanza extends StatefulWidget {
  @override
  State<Esperanza> createState() => _EsperanzaState();
}

class _EsperanzaState extends State<Esperanza> {
  final esperanza_pics = [
    Paths.eventEsperanza1,
    Paths.eventEsperanza2,
    Paths.eventEsperanza3,
    Paths.eventEsperanza4
  ];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(children: [
      SizedBox(
        width: _size.width,
        child: LottieBuilder.asset(
          Paths.lottieLoader,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: esperanza_pics.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(esperanza_pics[index]!, index);
          },
          options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 0.4),
        ),
      ),
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';

class Esperanza extends StatefulWidget {
  @override
  State<Esperanza> createState() => _EsperanzaState();
}

class _EsperanzaState extends State<Esperanza> {
  final esperanzaPics = [
    Assets.eventEsperanza1,
    Assets.eventEsperanza2,
    Assets.eventEsperanza3,
    Assets.eventEsperanza4
  ];

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Stack(children: [
      SizedBox(
        width: _size.width,
        child: LottieBuilder(
          lottie: Assets.lottieLoader.lottie,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: esperanzaPics.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(esperanzaPics[index]!, index);
          },
          options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 0.4),
        ),
      ),
    ]);
  }

  Widget buildImage(Image esperanzaPic, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.blue,
        child: Image(
          image: esperanzaPic.image,
          fit: BoxFit.cover,
        ),
      );
}

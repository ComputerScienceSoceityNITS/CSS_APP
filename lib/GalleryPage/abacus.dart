import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';

class Abacus extends StatefulWidget {
  @override
  State<Abacus> createState() => _AbacusState();
}

class _AbacusState extends State<Abacus> {
  final abacus_pics = [
    Paths.eventAbacus1,
    Paths.eventAbacus2,
    Paths.eventAbacus3
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
          itemCount: abacus_pics.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(abacus_pics[index]!, index);
          },
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.height * 0.4),
        ),
      ),
    ]);
  }

  Widget buildImage(String abacusPic, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.green,
        child: Image.asset(
          abacusPic,
          fit: BoxFit.cover,
        ),
      );
}

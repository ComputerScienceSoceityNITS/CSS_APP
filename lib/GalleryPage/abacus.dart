import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Abacus extends StatefulWidget {
  @override
  State<Abacus> createState() => _AbacusState();
}

class _AbacusState extends State<Abacus> {
  final abacus_pics = [
    "assets/4_abacus.jpeg",
    "assets/6.jpeg",
    "assets/9.jpeg"
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
              itemCount: abacus_pics.length,
              itemBuilder: (context, index, realIndex) {
                final abacusPic = abacus_pics[index];
                return buildImage(abacusPic, index);
              },
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.4))),
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

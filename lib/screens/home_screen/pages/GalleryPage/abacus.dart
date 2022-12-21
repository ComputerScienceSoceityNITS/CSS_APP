import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';

class Abacus extends StatefulWidget {
  const Abacus({Key? key}) : super(key: key);

  @override
  State<Abacus> createState() => _AbacusState();
}

class _AbacusState extends State<Abacus> {
  // ignore: non_constant_identifier_names
  final abacus_pics = [
    Assets.eventAbacus1,
    Assets.eventAbacus2,
    Assets.eventAbacus3
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
          itemCount: abacus_pics.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(abacus_pics[index], index);
          },
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: MediaQuery.of(context).size.height * 0.4),
        ),
      ),
    ]);
  }

  Widget buildImage(Image abacusPic, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.green,
        child: Image(
          image: abacusPic.image,
          fit: BoxFit.cover,
        ),
      );
}

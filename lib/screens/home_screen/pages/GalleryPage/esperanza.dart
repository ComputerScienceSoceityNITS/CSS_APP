// ignore_for_file: unused_import, prefer_final_fields, unused_local_variable, sized_box_for_whitespace

import 'package:cssapp/widgets/carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';
import "dart:math" as math;

class Esperanza extends StatefulWidget {
  const Esperanza({Key? key}) : super(key: key);

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
  List<double> _angle = [
    math.pi / 18.0,
    -math.pi / 15.0,
    math.pi / 18.0,
    -math.pi / 15.0
  ];
  // var _angle = -math.pi / 12.0;
  List<Color> _color = [Colors.white, Colors.white, Colors.white, Colors.white];
  // Color _color = Colors.white;
  List<BlendMode> _blendMode = [
    BlendMode.saturation,
    BlendMode.saturation,
    BlendMode.saturation,
    BlendMode.saturation
  ];
  // BlendMode _blendMode = BlendMode.saturation;
  List<double> _blur = [0.0, 0.0, 0.0, 0.0];
  // var _blur = 00.0;
  List<bool> _check = [false, false, false, false];

  void _reset(int index) {
    _blur[index] = 0.0;
    _check[index] = false;
    _color[index] = Colors.white;
    _blendMode[index] = BlendMode.saturation;
    if (index == 0) {
      _angle[index] = math.pi / 18.0;
    } else if (index == 1) {
      _angle[index] = -math.pi / 15.0;
    } else if (index == 2) {
      _angle[index] = math.pi / 18.0;
    } else if (index == 3) {
      _angle[index] = -math.pi / 15.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: esperanzaPics.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: GestureDetector(
            onTap: () {
              setState(() {
                // _height = 100;
                // _width = 100;
                _angle[index] = 0;
                _color[index] = const Color.fromARGB(255, 214, 50, 105);
                _blendMode[index] = BlendMode.softLight;
                _blur[index] = 40.0;
                for (int i = 0; i < _check.length; i++) {
                  if (_check[i] == true) {
                    _reset(i);
                  }
                }

                _check[index] = true;
              });
            },
            child: Center(
              child: Column(
                children: [
                  AnimatedContainer(
                      height: 300,
                      width: 300,
                      foregroundDecoration: BoxDecoration(
                        color: Colors.grey,
                        backgroundBlendMode: _blendMode[index],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: _blur[index],
                            color: _color[index],
                          )
                        ],
                      ),
                      transform: Matrix4.translationValues(0, 0, 0)
                        ..rotateZ(_angle[index]),
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 26,
                          ),
                          Container(
                              height: 230,
                              width: 280,
                              child: buildImage(esperanzaPics[index], index)),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "ESPERENZA",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20,
                                fontFamily: 'Cormorant Unicase'),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final _size = MediaQuery.of(context).size;
  // return Stack(children: [
  //   SizedBox(
  //     width: _size.width,
  //     child: LottieBuilder(
  //       lottie: Assets.lottieLoader.lottie,
  //       fit: BoxFit.fitWidth,
  //     ),
  //   ),
  //     SizedBox(
  //       height: double.infinity,
  //       width: double.infinity,
  //       child: CarouselSlider.builder(
  //         itemCount: esperanzaPics.length,
  //         itemBuilder: (context, index, realIndex) {
  //           return buildImage(esperanzaPics[index], index);
  //         },
  //         options: CarouselOptions(
  //             enlargeCenterPage: true,
  //             autoPlay: true,
  //             height: MediaQuery.of(context).size.height * 0.4),
  //       ),
  //     ),
  //   ]);
  // }

  Widget buildImage(Image esperanzaPic, int index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        color: Colors.blue,
        child: Image(
          image: esperanzaPic.image,
          fit: BoxFit.cover,
        ),
      );
}

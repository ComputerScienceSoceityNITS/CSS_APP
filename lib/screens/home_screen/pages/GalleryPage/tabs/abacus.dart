import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class Abacus extends StatelessWidget {
  Abacus({Key? key}) : super(key: key);

  final List<Image> abacusPics = [
    Assets.eventAbacus1,
    Assets.eventAbacus2,
    Assets.eventAbacus3
  ];

  @override
  Widget build(BuildContext context) {
    return Gallery(
      images: abacusPics,
      title: "ABACUS",
    );
  }
}

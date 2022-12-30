import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery.dart';
import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery_card.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import "dart:math" as math;
import 'package:collection/collection.dart';

class Abacus extends StatefulWidget {
  const Abacus({Key? key}) : super(key: key);

  @override
  State<Abacus> createState() => _AbacusState();
}

class _AbacusState extends State<Abacus> {
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

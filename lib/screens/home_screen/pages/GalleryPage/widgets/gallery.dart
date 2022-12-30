import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery_card.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

class Gallery extends StatefulWidget {
  final List<Image> images;
  final String title;
  const Gallery({Key? key, required this.images, required this.title})
      : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final List<double> _angle = [];
  final List<Color> _color = [];
  final List<BlendMode> _blendMode = [];
  final List<double> _blur = [];

  /// is the current card active
  final List<bool> _check = [];

  void _reset(int index) {
    _blur[index] = 0.0;
    _color[index] = Colors.white;
    _blendMode[index] = BlendMode.saturation;

    switch (index % 4) {
      case 0:
        _angle[index] = math.pi / 18.0;
        break;
      case 1:
        _angle[index] = -math.pi / 15.0;
        break;
      case 2:
        _angle[index] = math.pi / 18.0;
        break;
      case 3:
        _angle[index] = -math.pi / 15.0;
        break;
    }
  }

  List<GalleryCard> cards = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.images.length; i++) {
      _blur.add(0.0);
      _check.add(false);
      _color.add(Colors.white);
      _blendMode.add(BlendMode.saturation);
      switch (i % 4) {
        case 0:
          _angle.add(math.pi / 18.0);
          break;
        case 1:
          _angle.add(-math.pi / 15.0);
          break;
        case 2:
          _angle.add(math.pi / 18.0);
          break;
        case 3:
          _angle.add(-math.pi / 15.0);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    cards.clear();
    for (int index = 0; index < widget.images.length; index++) {
      cards.add(GalleryCard(
          onTap: () {
            setState(() {
              _angle[index] = 0;
              _color[index] = const Color.fromARGB(255, 214, 50, 105);
              _blendMode[index] = BlendMode.screen;
              _blur[index] = 40.0;
              for (int i = 0; i < _check.length; i++) {
                if (_check[i] == true) {
                  _reset(i);
                }
              }
              _check[index] = !_check[index];
            });
          },
          bgBlendMode: _blendMode[index],
          blurRadius: _blur[index],
          color: _color[index],
          angle: _angle[index],
          img: widget.images[index],
          title: widget.title));
    }
    return Column(
      children: cards,
    );
  }
}

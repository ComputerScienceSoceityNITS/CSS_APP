// import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery_card.dart';
// import 'package:flutter/material.dart';
// import "dart:math" as math;
// import 'package:cssapp/configs/configs.dart';

// class Gallery extends StatefulWidget {
//   const Gallery({Key? key}) : super(key: key);

//   @override
//   State<Gallery> createState() => _GalleryState();
// }

// class _GalleryState extends State<Gallery> {
//   final List<double> _angle = [];
//   final List<Color> _color = [];
//   final List<BlendMode> _blendMode = [];
//   final List<double> _blur = [];
//   final List<Image> images = [
//     Assets.galleryInspireRoom4,
//     Assets.galleryInspireRoom2,
//     Assets.galleryOrientation1,
//     Assets.galleryInspireRoom3,
//     Assets.galleryOrientation2,
//     Assets.galleryInspireRoom1,
//   ];
//   final List<String> titles = [
//     "Inspire Room",
//     "Inspire Room",
//     "CSS Orientation 26",
//     "Inspire Room",
//     "CSS Orientation 26",
//     "Inspire Room"
//   ];

//   /// is the current card active
//   final List<bool> _check = [];

//   void _reset(int index) {
//     _blur[index] = 0.0;
//     _color[index] = Colors.white;
//     _blendMode[index] = BlendMode.saturation;

//     switch (index % 4) {
//       case 0:
//         _angle[index] = math.pi / 18.0;
//         break;
//       case 1:
//         _angle[index] = -math.pi / 15.0;
//         break;
//       case 2:
//         _angle[index] = math.pi / 18.0;
//         break;
//       case 3:
//         _angle[index] = -math.pi / 15.0;
//         break;
//     }
//   }

//   List<GalleryCard> cards = [];
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < images.length; i++) {
//       _blur.add(0.0);
//       _check.add(false);
//       _color.add(Colors.white);
//       _blendMode.add(BlendMode.saturation);
//       switch (i % 4) {
//         case 0:
//           _angle.add(math.pi / 18.0);
//           break;
//         case 1:
//           _angle.add(-math.pi / 15.0);
//           break;
//         case 2:
//           _angle.add(math.pi / 18.0);
//           break;
//         case 3:
//           _angle.add(-math.pi / 15.0);
//           break;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     cards.clear();
//     for (int index = 0; index < images.length; index++) {
//       cards.add(
//         GalleryCard(
//             onTap: () {
//               setState(() {
//                 _angle[index] = 0;
//                 _color[index] = const Color.fromARGB(255, 214, 50, 105);
//                 _blendMode[index] = BlendMode.dstATop;
//                 _blur[index] = 40.0;
//                 for (int i = 0; i < _check.length; i++) {
//                   if (_check[i] == true) {
//                     _reset(i);
//                   }
//                 }
//                 _check[index] = !_check[index];
//               });
//             },
//             bgBlendMode: _blendMode[index],
//             blurRadius: _blur[index],
//             color: _color[index],
//             // angle: _angle[index],
//             img: images[index],
//             title: titles[index]),
//       );
//     }
//     return Column(
//       children: cards,
//     );
//   }
// }
// import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery_card.dart';
// import 'package:flutter/material.dart';
// import "dart:math" as math;
// import 'package:cssapp/configs/configs.dart';

// class Gallery extends StatefulWidget {
//   const Gallery({Key? key}) : super(key: key);

//   @override
//   State<Gallery> createState() => _GalleryState();
// }

// class _GalleryState extends State<Gallery> {
//   final List<double> _angle = [];
//   final List<Color> _color = [];
//   final List<BlendMode> _blendMode = [];
//   final List<double> _blur = [];
//   final List<Image> images = [
//     Assets.galleryInspireRoom4,
//     Assets.galleryInspireRoom2,
//     Assets.galleryOrientation1,
//     Assets.galleryInspireRoom3,
//     Assets.galleryOrientation2,
//     Assets.galleryInspireRoom1,
//   ];
//   final List<String> titles = [
//     "Inspire Room",
//     "Inspire Room",
//     "CSS Orientation 26",
//     "Inspire Room",
//     "CSS Orientation 26",
//     "Inspire Room"
//   ];

//   /// is the current card active
//   final List<bool> _check = [];

//   void _reset(int index) {
//     _blur[index] = 0.0;
//     _color[index] = const Color.fromARGB(255, 255, 255, 255); // Set the normal color here
//     _blendMode[index] = BlendMode.saturation;

//     switch (index % 4) {
//       case 0:
//         _angle[index] = math.pi / 18.0;
//         break;
//       case 1:
//         _angle[index] = -math.pi / 15.0;
//         break;
//       case 2:
//         _angle[index] = math.pi / 18.0;
//         break;
//       case 3:
//         _angle[index] = -math.pi / 15.0;
//         break;
//     }
//   }

//   List<GalleryCard> cards = [];
//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < images.length; i++) {
//       _blur.add(0.0);
//       _check.add(false);
//       _color.add(const Color.fromARGB(255, 255, 255, 255)); // Set the normal color here
//       _blendMode.add(BlendMode.saturation);
//       switch (i % 4) {
//         case 0:
//           _angle.add(math.pi / 18.0);
//           break;
//         case 1:
//           _angle.add(-math.pi / 15.0);
//           break;
//         case 2:
//           _angle.add(math.pi / 18.0);
//           break;
//         case 3:
//           _angle.add(-math.pi / 15.0);
//           break;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     cards.clear();
//     for (int index = 0; index < images.length; index++) {
//       cards.add(
//         GalleryCard(
//           onTap: () {
//             setState(() {
//               _angle[index] = 0;
//               _color[index] = const Color.fromARGB(255, 214, 50, 105);
//               _blendMode[index] = BlendMode.dstATop;
//               _blur[index] = 40.0;
//               for (int i = 0; i < _check.length; i++) {
//                 if (_check[i] == true) {
//                   _reset(i);
//                 }
//               }
//               _check[index] = !_check[index];
//             });
//           },
//           bgBlendMode: _blendMode[index],
//           blurRadius: _blur[index],
//           color: _color[index],
//           img: images[index],
//           title: titles[index],
//         ),
//       );
//     }
//     return Column(
//       children: cards,
//     );
//   }
// }
import 'package:cssapp/screens/home_screen/pages/GalleryPage/widgets/gallery_card.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;
import 'package:cssapp/configs/configs.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final List<double> _angle = [];
  final List<Color> _color = [];
  final List<BlendMode> _blendMode = [];
  final List<double> _blur = [];
  final List<Image> images = [
    Assets.galleryInspireRoom4,
    Assets.galleryInspireRoom2,
    Assets.galleryOrientation1,
    Assets.galleryInspireRoom3,
    Assets.galleryOrientation2,
    Assets.galleryInspireRoom1,
  ];
  final List<String> titles = [
    "Inspire Room",
    "Inspire Room",
    "CSS Orientation 26",
    "Inspire Room",
    "CSS Orientation 26",
    "Inspire Room"
  ];

  /// is the current card active
  final List<bool> _check = [];

  void _reset(int index) {
    _blur[index] = 0.0;
    _color[index] = Colors.white;
    _blendMode[index] = BlendMode.saturation;

    switch (index % 4) {
      case 0:
        _angle[index] = math.pi / 15.0;
        break;
      case 1:
        _angle[index] = -math.pi / 12.0;
        break;
      case 2:
        _angle[index] = math.pi / 15.0;
        break;
      case 3:
        _angle[index] = -math.pi / 12.0;
        break;
    }
  }

  List<GalleryCard> cards = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < images.length; i++) {
      _blur.add(0.0);
      _check.add(false);
      _color.add(Colors.white); // Initialize with a transparent color
      _blendMode.add(BlendMode.saturation);
      switch (i % 4) {
        case 0:
          _angle.add(math.pi / 15.0);
          break;
        case 1:
          _angle.add(-math.pi / 12.0);
          break;
        case 2:
          _angle.add(math.pi / 15.0);
          break;
        case 3:
          _angle.add(-math.pi / 12.0);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    cards.clear();
    for (int index = 0; index < images.length; index++) {
      cards.add(
        GalleryCard(
          onTap: () {
            setState(() {
              // _angle[index] = 0;
              _color[index] = const Color.fromARGB(255, 214, 50, 105);
              _blendMode[index] = BlendMode.dstATop;
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
          // angle: _angle[index],
          color: _color[index], 
          img: images[index],
          title: titles[index],
        ),
      );
    }
    return Column(
      children: cards,
    );
  }
}

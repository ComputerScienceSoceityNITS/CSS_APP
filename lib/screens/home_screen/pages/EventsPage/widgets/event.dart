import 'dart:ui';

import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Event extends StatelessWidget {
  final String? stylisedChar;
  final String title;
  final String? titleLine2;
  final Image thumbnail;
  final String? details;
  final String? imagepath;
  final List<String> events;
  final bool addBorderRadiusToThumbnail;
  const Event(
      {Key? key,
      this.stylisedChar,
      required this.title,
      this.titleLine2,
      required this.thumbnail,
      this.details,
      required this.events,
      required this.imagepath,
      this.addBorderRadiusToThumbnail = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> eventTitle = [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Offstage(
            offstage: stylisedChar == null,
            child: Text(
              stylisedChar ?? '',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 25,
                color: Pallet.accentColor,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
              fontFamily: "Segoe Font",
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ],
      ),
      const SizedBox(width: 10),
      Offstage(
        offstage: titleLine2 == null,
        child: Text(
          titleLine2 ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Segoe Font",
            fontSize: 20,
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FlipCard(
        fill: Fill.fillBack,
        front: _BaseCard(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image(image: AssetImage(imagepath.toString())),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: addBorderRadiusToThumbnail ? 150 : 200,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: thumbnail.image, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: addBorderRadiusToThumbnail ? 20 : 10),
              Column(
                children: eventTitle,
              )
            ],
          ),
        ),
        back: _BaseCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...eventTitle,
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Text(
                  details ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 11,
                  ),
                ),
              ),
              ...events.map(
                (event) => Text(
                  event,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 17, height: 1.3, color: Pallet.accentColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Widget child;
  const _BaseCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            width: 230,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade200.withOpacity(0.1)
                  : Colors.grey.shade200.withOpacity(0.9),
              border: Border.all(width: 0.5, color: Colors.grey),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

// class Eventenigma extends StatelessWidget {
//   final String? stylisedChar;
//   final String title;
//   final String? titleLine2;
//   final Image thumbnail;
//   final String? details;
//   final String? imagepath;
//   final List<String> events;
//   final bool addBorderRadiusToThumbnail;
//   const Eventenigma(
//       {Key? key,
//       this.stylisedChar,
//       required this.title,
//       this.titleLine2,
//       required this.thumbnail,
//       this.details,
//       required this.events,
//       required this.imagepath,
//       this.addBorderRadiusToThumbnail = true})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> eventTitle = [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Offstage(
//             offstage: stylisedChar == null,
//             child: Text(
//               stylisedChar ?? '',
//               textAlign: TextAlign.right,
//               style: const TextStyle(
//                 fontSize: 25,
//                 color: Pallet.accentColor,
//               ),
//             ),
//           ),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 25,
//               fontFamily: "Segoe Font",
//               color: Theme.of(context).backgroundColor,
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(width: 10),
//       Offstage(
//         offstage: titleLine2 == null,
//         child: Text(
//           titleLine2 ?? '',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontFamily: "Segoe Font",
//             fontSize: 25,
//             color: Theme.of(context).backgroundColor,
//           ),
//         ),
//       ),
//     ];
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: FlipCard(
//         fill: Fill.fillBack,
//         front: _BaseCardenigma(
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //Image(image: AssetImage(imagepath.toString())),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   width: addBorderRadiusToThumbnail ? 150 : 200,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     shape: BoxShape.rectangle,
//                     image: DecorationImage(
//                         image: AssetImage(imagepath.toString()),
//                         fit: BoxFit.cover),
//                   ),
//                 ),
//               ),
//               SizedBox(height: addBorderRadiusToThumbnail ? 20 : 10),
//               Column(
//                 children: eventTitle,
//               )
//             ],
//           ),
//         ),
//         back: _BaseCardenigma(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: eventTitle,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                 child: Text(
//                   details ?? '',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Theme.of(context).backgroundColor,
//                     fontSize: 11,
//                   ),
//                 ),
//               ),
//               ...events.map(
//                 (event) => Text(
//                   event,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontSize: 17, height: 1.3, color: Pallet.accentColor),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _BaseCardenigma extends StatelessWidget {
//   final Widget child;
//   const _BaseCardenigma({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       //scrollDirection: Axis.horizontal,
//       child: ClipRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
//           child: Container(
//             width: 230,
//             height: 300,
//             decoration: BoxDecoration(
//               color: Theme.of(context).brightness == Brightness.dark
//                   ? Colors.grey.shade200.withOpacity(0.1)
//                   : Colors.grey.shade200.withOpacity(0.9),
//               border: Border.all(width: 0.5, color: Colors.grey),
//             ),
//             child: child,
//           ),
//         ),
//       ),
//     );
//   }
// }

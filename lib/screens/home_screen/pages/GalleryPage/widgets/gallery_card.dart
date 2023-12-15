// import 'package:flutter/material.dart';

// // ignore: todo
// // TODO: Optimise further
// class GalleryCard extends StatelessWidget {
//   final void Function() onTap;
//   final BlendMode bgBlendMode;
//   final double blurRadius;
//   final Color color;
//   final double angle;
//   final Image img;
//   final String title;
//   const GalleryCard(
//       {Key? key,
//       required this.onTap,
//       required this.bgBlendMode,
//       required this.blurRadius,
//       required this.color,
//       required this.angle,
//       required this.img,
//       required this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       child: Padding(
//         padding: const EdgeInsets.all(50),
//         child: GestureDetector(
//           onTap: onTap,
//           child: AnimatedContainer(
//             height: 300,
//             width: 300,
//             foregroundDecoration: BoxDecoration(
//               color: Theme.of(context).canvasColor,
//               backgroundBlendMode: bgBlendMode,
//               borderRadius: BorderRadius.circular(10),
//               border: Theme.of(context).brightness == Brightness.dark
//                   ? Border.all(width: 0)
//                   : null,
//             ),
//             decoration: BoxDecoration(
//               color: Theme.of(context).canvasColor,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: blurRadius,
//                   color: color,
//                 )
//               ],
//             ),
//             transform: Matrix4.rotationZ(angle),
//             duration: const Duration(milliseconds: 300),
//             child: Column(
//               children: [
//                 const SizedBox(height: 26),
//                 SizedBox(height: 230, width: 280, child: BuildImage(img: img)),
//                 const SizedBox(height: 5),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       color: Colors.pink,
//                       fontSize: 20,
//                       fontFamily: 'Cormorant Unicase'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BuildImage extends StatelessWidget {
//   final Image img;
//   const BuildImage({Key? key, required this.img}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.symmetric(vertical: 20), child: img);
//   }
// }


// import 'package:flutter/material.dart';

// // ignore: todo
// // TODO: Optimise further
// class GalleryCard extends StatelessWidget {
//   final void Function() onTap;
//   final BlendMode bgBlendMode;
//   final double blurRadius;
//   final Color color;
//   // final double angle;
//   final Image img;
//   final String title;

//   const GalleryCard({
//     Key? key,
//     required this.onTap,
//     required this.bgBlendMode,
//     required this.blurRadius,
//     required this.color,
//     // required this.angle,
//     required this.img,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       child: Padding(
//         padding: const EdgeInsets.all(50),
//         child: GestureDetector(
//           onTap: onTap,
//           child: AnimatedContainer(
//             height: 300,
//             width: 300,
//             foregroundDecoration: BoxDecoration(
//               color: Theme.of(context).canvasColor,
//               backgroundBlendMode: bgBlendMode,
//               borderRadius: BorderRadius.circular(10),
//               border: Theme.of(context).brightness == Brightness.light
//                   ? Border.all(width: 0)
//                   : null,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white, // Set the default color here
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: blurRadius,
//                   color: color,
//                 )
//               ],
//             ),
//             // Remove the rotation transform
//             // transform: Matrix4.rotationZ(angle),

//             duration: const Duration(milliseconds: 300),
//             child: Column(
//               children: [
//                 const SizedBox(height: 26),
//                 SizedBox(height: 230, width: 280, child: BuildImage(img: img)),
//                 const SizedBox(height: 5),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.pinkAccent,
//                     fontSize: 20,
//                     fontFamily: 'Segoe Font',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BuildImage extends StatelessWidget {
//   final Image img;

//   const BuildImage({Key? key, required this.img}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 20),
//       child: img,
//     );
//   }
// }
import 'package:flutter/material.dart';

class GalleryCard extends StatefulWidget {
  final void Function() onTap;
  final BlendMode bgBlendMode;
  final double blurRadius;
  final Color color;
  final Image img;
  final String title;

  const GalleryCard({
    Key? key,
    required this.onTap,
    required this.bgBlendMode,
    required this.blurRadius,
    required this.color,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  _GalleryCardState createState() => _GalleryCardState();
}

class _GalleryCardState extends State<GalleryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: GestureDetector(
          onTap: () {
            widget.onTap();
            _controller.forward(from: 0.0); // Start the zoom-in animation
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    backgroundBlendMode: widget.bgBlendMode,
                    borderRadius: BorderRadius.circular(10),
                    border: Theme.of(context).brightness == Brightness.dark
                        ? Border.all(width: 0)
                        : null,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: widget.blurRadius,
                        color: widget.color,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 26),
                      SizedBox(
                        height: 230,
                        width: 280,
                        child: BuildImage(img: widget.img),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 61, 7, 237),
                          fontSize: 20,
                          fontFamily: 'Segoe Font',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BuildImage extends StatelessWidget {
  final Image img;

  const BuildImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: img,
    );
  }
}

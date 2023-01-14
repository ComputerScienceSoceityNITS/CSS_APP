import 'package:flutter/material.dart';

// TODO: Optimise further
class GalleryCard extends StatelessWidget {
  final void Function() onTap;
  final BlendMode bgBlendMode;
  final double blurRadius;
  final Color color;
  final double angle;
  final Image img;
  final String title;
  const GalleryCard(
      {Key? key,
      required this.onTap,
      required this.bgBlendMode,
      required this.blurRadius,
      required this.color,
      required this.angle,
      required this.img,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            height: 300,
            width: 300,
            foregroundDecoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              backgroundBlendMode: bgBlendMode,
              borderRadius: BorderRadius.circular(10),
              border: Theme.of(context).brightness == Brightness.dark
                  ? Border.all(width: 0)
                  : null,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: blurRadius,
                  color: color,
                )
              ],
            ),
            transform: Matrix4.rotationZ(angle),
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: [
                const SizedBox(height: 26),
                SizedBox(height: 230, width: 280, child: BuildImage(img: img)),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 20,
                      fontFamily: 'Cormorant Unicase'),
                ),
              ],
            ),
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
        margin: const EdgeInsets.symmetric(vertical: 20), child: img);
  }
}

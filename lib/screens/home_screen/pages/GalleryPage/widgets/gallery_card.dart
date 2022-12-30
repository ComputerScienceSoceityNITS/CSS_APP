import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Column(
            children: [
              AnimatedContainer(
                height: 300,
                width: 300,
                foregroundDecoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    backgroundBlendMode: bgBlendMode,
                    border: Border.all(width: 0)),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: blurRadius,
                      color: color,
                    )
                  ],
                ),
                transform: Matrix4.translationValues(0, 0, 0)..rotateZ(angle),
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                        height: 230, width: 280, child: BuildImage(img: img)),
                    const SizedBox(
                      height: 5,
                    ),
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
            ],
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
      color: Colors.green,
      child: Image(
        image: img.image,
        fit: BoxFit.cover,
      ),
    );
  }
}

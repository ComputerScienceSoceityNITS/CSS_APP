import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';
import 'widgets/gallery.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: 200,
                child: Opacity(
                  opacity: 0.7,
                  child: Assets.lottieGallery,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 59, 190),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "G",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontFamily: 'Segoe Font',
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width:7),
                      Text(
                        "ALLERY",
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 60,
                    child: Text(
                      "A Picture is \nWorth a Thousand Words",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Segoe Font'),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  const SizedBox(
                    child: Gallery(),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

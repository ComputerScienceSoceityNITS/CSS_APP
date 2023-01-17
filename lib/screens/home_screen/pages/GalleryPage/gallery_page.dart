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
                  child: LottieBuilder(
                    lottie: Assets.lottieSingSong.lottie,
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 53,
                        decoration: BoxDecoration(
                            color: Pallet.accentColor,
                            borderRadius: BorderRadius.circular(5)),
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
                      const SizedBox(width: 10),
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
                    alignment: Alignment.center,
                    height: 60,
                    child: Text(
                      "Things end but \nMemories last forever",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'EastSeaDokdo'),
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

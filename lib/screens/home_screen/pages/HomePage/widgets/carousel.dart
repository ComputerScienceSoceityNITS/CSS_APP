import 'package:cssapp/packages/carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Carousel extends StatefulWidget {
  final Size screenSize;
  const Carousel({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> videos = [
    "https://www.youtube.com/watch?v=V6iKSUoUN48",
    "https://www.youtube.com/watch?v=JDglMK9sgIQ",
    "https://www.youtube.com/watch?v=tKzq4PDcRIo"
  ];

  List<Widget> items = [];
  @override
  void initState() {
    super.initState();

    for (String link in videos) {
      items.add(
        SizedBox(
          width: widget.screenSize.width * 0.8,
          child: YoutubePlayerScaffold(
            enableFullScreenOnVerticalDrag: false,
            controller: YoutubePlayerController.fromVideoId(
              videoId: YoutubePlayerController.convertUrlToId(link) ?? "",
              autoPlay: false,
              params: const YoutubePlayerParams(
                showFullscreenButton: false,
              ),
            ),
            builder: (BuildContext context, Widget player) {
              return player;
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          enableInfiniteScroll: false,
          initialPage: 0,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

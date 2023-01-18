import 'package:cssapp/packages/carousel_slider/carousel_slider.dart';
import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  final Size screenSize;
  const Carousel({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> videos = [
    "https://youtu.be/MTOIyf_5hK8",
    "https://youtu.be/thDxyKlGHWE"
  ];

  List<Widget> items = [];
  @override
  void initState() {
    super.initState();

    for (String link in videos) {
      items.add(
        SizedBox(
          width: widget.screenSize.width * 0.8,
          child: Provider.of<MemberApi>(context, listen: false).isOnline
              ? YoutubePlayerScaffold(
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
                )
              : const FadeShimmer(
                  width: 350,
                  height: 200,
                  highlightColor: Color(0xffc0c3d3),
                  baseColor: Color(0xff999aa1),
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

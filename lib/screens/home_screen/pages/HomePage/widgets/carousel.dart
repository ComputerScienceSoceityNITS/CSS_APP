import 'package:cssapp/packages/carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Carousel extends StatefulWidget {
  final Size screenSize;
  const Carousel({Key? key, required this.screenSize}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> videos = [
    "https://video-lax3-1.xx.fbcdn.net/v/t39.25447-2/324724712_493567939520460_3669204819361348516_n.mp4?_nc_cat=110&vs=7b467c2fdd85b6db&_nc_vs=HBksFQAYJEdPam5XaFBNSjdXOTVjQUJBS1E3TDhwWG91c3libWRqQUFBRhUAAsgBABUAGCRHTXg1VVJOeHNNZWJCbmdDQUlaQlhZckx2bmtmYnJGcUFBQUYVAgLIAQBLB4gScHJvZ3Jlc3NpdmVfcmVjaXBlATENc3Vic2FtcGxlX2ZwcwAQdm1hZl9lbmFibGVfbnN1YgAgbWVhc3VyZV9vcmlnaW5hbF9yZXNvbHV0aW9uX3NzaW0AKGNvbXB1dGVfc3NpbV9vbmx5X2F0X29yaWdpbmFsX3Jlc29sdXRpb24AHXVzZV9sYW5jem9zX2Zvcl92cW1fdXBzY2FsaW5nABFkaXNhYmxlX3Bvc3RfcHZxcwAVACUAHAAAJpq04o7vioYFFQIoAkMzGAt2dHNfcHJldmlldxwXQDPKfvnbItEYKWRhc2hfaTRsaXRlYmFzaWNfNXNlY2dvcF9ocTJfZnJhZ18yX3ZpZGVvEgAYGHZpZGVvcy52dHMuY2FsbGJhY2sucHJvZDgSVklERU9fVklFV19SRVFVRVNUGwqIFW9lbV90YXJnZXRfZW5jb2RlX3RhZwZvZXBfaGQTb2VtX3JlcXVlc3RfdGltZV9tcwEwDG9lbV9jZmdfcnVsZQd1bm11dGVkE29lbV9yb2lfcmVhY2hfY291bnQEMjUxNhFvZW1faXNfZXhwZXJpbWVudAAMb2VtX3ZpZGVvX2lkDzU2MDk2ODY4ODk3NTI3MxJvZW1fdmlkZW9fYXNzZXRfaWQQMzQxNjQ2NTQyODU3MzQwNRVvZW1fdmlkZW9fcmVzb3VyY2VfaWQQMTQyMDc1NTczNTQzMjQ2MRxvZW1fc291cmNlX3ZpZGVvX2VuY29kaW5nX2lkEDExNTUxNDM0OTg0OTczMTUOdnRzX3JlcXVlc3RfaWQAJQIcACXEARsHiAFzBDM5ODECY2QKMjAyMy0wMS0xMQNyY2IEMjUwMANhcHAGVmlkZW9zAmN0GUNPTlRBSU5FRF9QT1NUX0FUVEFDSE1FTlQTb3JpZ2luYWxfZHVyYXRpb25fcwkxOS44MTg2NjcCdHMVcHJvZ3Jlc3NpdmVfZW5jb2RpbmdzAA%3D%3D&ccb=1-7&_nc_sid=189a0e&efg=eyJ2ZW5jb2RlX3RhZyI6Im9lcF9oZCJ9&_nc_ohc=-CdCaXSCJ78AX96PLhQ&_nc_ht=video-lax3-1.xx&oh=00_AfDcV82Hd3A39bOnZZ701Z52AMA5HKdJo0oLeDINaGHZsA&oe=63C45019&_nc_rid=886456067255940",
  ];

  List<Widget> items = [];
  @override
  void initState() {
    super.initState();

    for (String link in videos) {
      items.add(
        SizedBox(
          width: widget.screenSize.width * 0.8,
          child: HtmlWidget(
            "<iframe src='$link'></iframe>",
            baseUrl: Uri.parse(link),
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

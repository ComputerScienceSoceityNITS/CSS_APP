import 'package:flutter/material.dart';
import 'event_dialog.dart';

class Event extends StatefulWidget {
  final Key? key;
  final String title;
  final String desc;
  final Image img;
  final String link;
  final double height;
  const Event(
      {this.key,
      required this.title,
      required this.desc,
      required this.img,
      this.link = "",
      this.height = 60})
      : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  bool isVisible = true;
  GlobalKey containerKey = GlobalKey();
  Duration movingDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = false;
        });
        Navigator.push(
            context,
            PageRouteBuilder(
                opaque: false,
                barrierColor: Colors.black.withOpacity(0.7),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
                pageBuilder: (BuildContext context, _, __) {
                  return EventDialog(
                    desc: widget.desc,
                    link: widget.link,
                    img: widget.img,
                    height: widget.height,
                    width: 300,
                    movingDuration: movingDuration,
                    parentKey: containerKey,
                  );
                })).then((value) => setState(() => isVisible = true));
      },
      child: Opacity(
        opacity: isVisible ? 1 : 0,
        child: Container(
          key: containerKey,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
          width: double.infinity,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: widget.img.image,
              fit: BoxFit.cover,
              opacity: 0.75,
            ),
          ),
          child: Container(
              alignment: Alignment.center,
              //stroke text for the event title
              child: Stack(
                children: [
                  // Stroked text as border.
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.black,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              )
              //
              //
              //
              // Text(
              //   widget.title,
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 30,
              //       fontWeight: FontWeight.w900,
              //       decoration: TextDecoration.none,

              //       ),
              // ),
              ),
        ),
      ),
    );
  }
}

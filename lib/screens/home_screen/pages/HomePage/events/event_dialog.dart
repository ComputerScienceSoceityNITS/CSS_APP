import 'package:flutter/material.dart';
import 'package:cssapp/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDialog extends StatefulWidget {
  final Image img;
  final String desc;
  final String link;

  const EventDialog(
      {Key? key, required this.img, required this.desc, required this.link})
      : super(key: key);

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bodyHeight = 400;
    return ScaleTransition(
      scale: scaleAnimation,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: widget.img.image,
                height: bodyHeight,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              height: bodyHeight,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: bodyHeight - 50,
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ExpandedButton(
                      child: const Text("x"),
                      onTap: () {
                        scaleAnimation = CurvedAnimation(
                            parent: controller, curve: Curves.easeInOut);

                        controller.addListener(() {
                          setState(() {});
                        });
                        controller
                            .reverse()
                            .then((value) => Navigator.pop(context));
                        ;
                      },
                    ),
                  ),
                  Text(
                    widget.desc,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => launch(widget.link),
                        child: widget.link.isNotEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Learn More",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

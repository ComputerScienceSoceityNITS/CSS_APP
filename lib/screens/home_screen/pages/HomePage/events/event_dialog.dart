import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/configs/text_style.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDialog extends StatefulWidget {
  final Image img;
  final String title;
  final String desc;
  final String? link;
  final double height;
  final double width;
  final double coverScreenPercentage;
  final Duration openingDuration;
  final Duration movingDuration;
  final GlobalKey parentKey;
  const EventDialog(
      {Key? key,
      required this.img,
      required this.title,
      required this.desc,
      this.link,
      required this.height,
      required this.width,
      this.coverScreenPercentage = 0.6,
      this.openingDuration = const Duration(milliseconds: 300),
      required this.movingDuration,
      required this.parentKey})
      : super(key: key);

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  late double height;
  late double positionY;
  late double parentPosY;
  bool isClosing = false;
  @override
  void initState() {
    super.initState();
    height = widget.height;
    parentPosY =
        (widget.parentKey.currentContext!.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero)
            .dy;
    positionY = parentPosY;
    Future.delayed(const Duration(milliseconds: 5), () {
      setState(() {
        positionY = MediaQuery.of(context).size.height *
            (1 - widget.coverScreenPercentage) /
            2;
      });
    });
    Future.delayed(widget.movingDuration, () {
      setState(() {
        height =
            MediaQuery.of(context).size.height * widget.coverScreenPercentage;
      });
    });
  }

  Future<void> exit() async {
    setState(() {
      isClosing = true;
      height = widget.height;
    });
    await Future.delayed(
        widget.openingDuration + const Duration(milliseconds: 5), () async {
      setState(() {
        positionY = parentPosY;
      });
    });
    await Future.delayed(
      widget.movingDuration + const Duration(milliseconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Hero(
      tag: widget.img.image,
      child: WillPopScope(
        onWillPop: () async {
          await exit();
          return true;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: widget.movingDuration,
              top: positionY,
              curve: Curves.easeOut,
              child: AnimatedContainer(
                duration: widget.openingDuration,
                curve: Curves.easeIn,
                height: height,
                width: widget.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: widget.img.image,
                        height:
                            screenSize.height * widget.coverScreenPercentage,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      height: screenSize.height * widget.coverScreenPercentage,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: ExpandedButton(
                                  child: Text(
                                    "x",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Colors.red, fontSize: 30),
                                  ),
                                  onTap: () async {
                                    await exit();
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Text(
                                widget.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                widget.desc,
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 17,
                                        height: 1.2,
                                        color: Colors.white),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => launch(widget.link ?? ''),
                                    child: widget.link != null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Learn More",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(

                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Pallet.accentColor,
                                                    ),
                                              ),
                                              const Icon(
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
            ),
          ],
        ),
      ),
    );
  }
}

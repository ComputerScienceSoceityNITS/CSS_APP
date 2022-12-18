import 'package:flutter/material.dart';
import 'package:cssapp/widgets/expanded_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatefulWidget {
  /// Width of card
  final double? width;

  /// Width of card
  final double? widthPercentage;

  /// Height of the widget when not clicked
  final double? smallHeight;

  /// Height of the widget when not clicked in percentage of MediaQuery
  final double? smallHeightPercentage;

  /// Height of widget when clicked (i.e. active)
  final double? fullHeight;

  /// Height of widget when clicked in percentage of MediaQuery
  final double? fullHeightPercentage;

  /// Position of top of the widget when clicked(i.e. active)
  final double? fullTopPosition;

  /// Position of top of the widget when clicked in percentage of MediaQuery
  final double? fullTopPositionPercentage;

  /// Duration of position animation
  final Duration positionAnimDuration;

  /// Duration of height of the widget animation
  final Duration? sizeAnimDuration;

  /// Curve of the animation
  final Curve curve;

  /// BG Image of the card
  final ImageProvider bgImage;

  /// Title of the card shown when not clicked
  final String title;

  /// Content of the card when clicked
  final String desc;

  final double borderRadius;
  final String url;

  /// Index of the card
  final int itemNo;

  /// Gap between each cards
  final double gap;
  const CustomCard(
      {Key? key,
      this.width,
      this.widthPercentage,
      this.smallHeight,
      this.smallHeightPercentage,
      this.fullHeight,
      this.fullHeightPercentage,
      this.fullTopPosition,
      this.fullTopPositionPercentage,
      this.positionAnimDuration = const Duration(milliseconds: 300),
      this.sizeAnimDuration,
      this.curve = Curves.easeInOut,
      required this.bgImage,
      required this.title,
      required this.desc,
      this.borderRadius = 5,
      this.url = '',
      required this.itemNo,
      this.gap = 0})
      : assert(width != null || widthPercentage != null,
            'either width or widthPercentage must be provided'),
        assert(smallHeight != null || smallHeightPercentage != null,
            'either smallHeight or smallHeightPercentage must be provided'),
        assert(fullHeight != null || fullHeightPercentage != null,
            'either fullHeight or fullHeightPercentage must be provided'),
        assert(fullTopPosition != null || fullTopPositionPercentage != null,
            'either fullTopPosition or fullTopPositionPercentage must be provided'),
        super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  late Size size;
  bool isDetailsPage = false;
  double smallHeight = 0;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    smallHeight = widget.smallHeightPercentage != null
        ? widget.smallHeightPercentage! * size.height
        : widget.smallHeight!;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
            top: widget.itemNo * (smallHeight + widget.gap),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDetailsPage = !isDetailsPage;
                });
              },
              child: AnimatedContainer(
                  duration:
                      widget.sizeAnimDuration ?? widget.positionAnimDuration,
                  height: isDetailsPage
                      ? (widget.fullHeightPercentage != null
                          ? widget.fullHeightPercentage! * size.height
                          : widget.fullHeight)
                      : widget.smallHeight,
                  width: widget.widthPercentage != null
                      ? size.width * widget.widthPercentage!
                      : widget.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: widget.bgImage, fit: BoxFit.cover, opacity: 0.8),
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        duration: widget.positionAnimDuration,
                        opacity: isDetailsPage ? 0 : 1,
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: widget.positionAnimDuration,
                        opacity: isDetailsPage ? 1 : 0,
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: ExpandedButton(
                                child: const Text("x"),
                                onTap: () {},
                              ),
                            ),
                            SingleChildScrollView(
                              child: Text(
                                widget.desc,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => launch(widget.url),
                                  child: widget.url.isNotEmpty
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                  )),
            ),
            duration: widget.positionAnimDuration),
      ],
    );
  }
}

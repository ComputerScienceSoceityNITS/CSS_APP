import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/widgets/widgets.dart';

class Events extends StatelessWidget {
  static final List<_Event> events = [
    _Event(
      title: "ESPERANZA",
      desc:
          "The event that excites every first-year guy and girl, which not only build their confidence but also add creativity to their levels. The main aim of this party is to give a warm welcome to the new comers. It is accompanied with so many colourful events and programs like ramp walk, traditional, fusion, and western dances, exhilarating singing performances, and splendid decoration, thus making it a soulful evening.",
      img: Assets.bgMusicController,
    ),
    _Event(
      title: "ENIGMA",
      desc:
          "Computer Science Society organizes coding contests for first year students. This contest being open to all enhances a good competitive environment for the students. The questions are made such that even students will little or basic Knowledge of programming can surely attempt the questions. Learning programming is now an essential skill for various placement interviews and our society encourages more and more participation in such activities",
      img: Assets.bgCode,
    ),
    _Event(
      title: "ABACUS",
      desc:
          "The annual Computer Science and Engineering week - ABACUS! The excitement begins each year, for the Annual week of the CSE department in which different games and competitions takes place where everyone gets a cool opportunity to prove their skills down and claim the prize money.But the most unique point about it is that it gives you, the freshers, the opportunity to become organizers, to present your ideas, instead of just participating and enables you to learn numerous things.",
      img: Assets.bgAbacus,
      link: "https://www.facebook.com/csenitsabacus",
    ),
    _Event(
        title: "BITSCRIBE",
        desc:
            "Every year, the Computer Science society excels in doing something new and innovative. It doesn’t remain dormant. The newsletter ‘bitscribe’ is a recent gift for the students of NIT Silchar from the society.It consists of articles by alumni as well as the current students of CSE which are full of motivation and knowledge. The newsletter requires a lot of effort and unity which shows the potential and efforts of the society.Whatever the society does, it never compromises with quality!",
        img: Assets.bgMagazine,
        link:
            "https://issuu.com/bitscribe/docs/bitscribe_1_?fbclid=IwAR3WTcvsRco6gI-enMchIkBfhzKInZIgliMYlxi-TLOb1SxVK_7-sH7mJyQ"),
    _Event(
        title: "LIT WEEK",
        desc:
            "The annual Computer Science and Engineering week - Abacus, is right around the corner.” Yeah, this is how the excitement begins each year, for the Annual week of the CSE dept. in which different games and competitions takes place where everyone gets a cool opportunity to prove their skills down and claim the prize money.But the most unique point about it is that it gives you, the freshers, the opportunity to become organizers, to present your ideas, instead of just participating and enables you to learn numerous things.",
        img: Assets.bgFlower,
        link: "https://www.facebook.com/CSS.NITSilchar")
  ];

  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
        child: Column(
            children: events.map((event) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _EventDialog(event: event),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              width: double.infinity,
              height: 70,
              child: Card(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          image: event.img.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      event.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList()),
      ),
    );
  }
}

class _Event {
  final String title;
  final String desc;
  final Image img;
  final String link;
  const _Event(
      {required this.title,
      required this.desc,
      required this.img,
      this.link = ""});
}

class _EventDialog extends StatefulWidget {
  final _Event event;
  const _EventDialog({Key? key, required this.event}) : super(key: key);

  @override
  State<_EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<_EventDialog>
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
                image: widget.event.img.image,
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
                    widget.event.desc,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => launch(widget.event.link),
                        child: widget.event.link.isNotEmpty
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

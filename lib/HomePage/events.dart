import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cssapp/configs/configs.dart';

class Events extends StatelessWidget {
  var event = [
    {
      "title": "ESPERANZA",
      "content":
          "The event that excites every first-year guy and girl, which not only build their confidence but also add creativity to their levels. The main aim of this party is to give a warm welcome to the new comers. It is accompanied with so many colourful events and programs like ramp walk, traditional, fusion, and western dances, exhilarating singing performances, and splendid decoration, thus making it a soulful evening.",
      "picture": Paths.bgMusicController,
      "link": ""
    },
    {
      "title": "ENIGMA",
      "content":
          "Computer Science Society organizes coding contests for first year students. This contest being open to all enhances a good competitive environment for the students. The questions are made such that even students will little or basic Knowledge of programming can surely attempt the questions. Learning programming is now an essential skill for various placement interviews and our society encourages more and more participation in such activities",
      "picture": Paths.bgCode,
      "link": ""
    },
    {
      "title": "ABACUS",
      "content":
          "The annual Computer Science and Engineering week - ABACUS! The excitement begins each year, for the Annual week of the CSE department in which different games and competitions takes place where everyone gets a cool opportunity to prove their skills down and claim the prize money.But the most unique point about it is that it gives you, the freshers, the opportunity to become organizers, to present your ideas, instead of just participating and enables you to learn numerous things.",
      "picture": Paths.bgAbacus,
      "link": "https://www.facebook.com/csenitsabacus"
    },
    {
      "title": "BITSCRIBE",
      "content":
          "Every year, the Computer Science society excels in doing something new and innovative. It doesn’t remain dormant. The newsletter ‘bitscribe’ is a recent gift for the students of NIT Silchar from the society.It consists of articles by alumni as well as the current students of CSE which are full of motivation and knowledge. The newsletter requires a lot of effort and unity which shows the potential and efforts of the society.Whatever the society does, it never compromises with quality!",
      "picture": Paths.bgMagazine,
      "link":
          "https://issuu.com/bitscribe/docs/bitscribe_1_?fbclid=IwAR3WTcvsRco6gI-enMchIkBfhzKInZIgliMYlxi-TLOb1SxVK_7-sH7mJyQ"
    },
    {
      "title": "LIT WEEK",
      "content":
          "The annual Computer Science and Engineering week - Abacus, is right around the corner.” Yeah, this is how the excitement begins each year, for the Annual week of the CSE dept. in which different games and competitions takes place where everyone gets a cool opportunity to prove their skills down and claim the prize money.But the most unique point about it is that it gives you, the freshers, the opportunity to become organizers, to present your ideas, instead of just participating and enables you to learn numerous things.",
      "picture": Paths.bgFlower,
      "link": "https://www.facebook.com/CSS.NITSilchar"
    },
  ];
  Widget _dialog(
    BuildContext context,
    var entry,
  ) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            "${entry["picture"]}",
            height: 400,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 350,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(230, 5, 5, 5),
                  child: InkWell(
                    child: const Text(
                      "x",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                Text(
                  '${entry["content"]}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Row(
                        children: const [
                          Text(
                            "Learn More",
                            // textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onTap: () => launch('${entry["link"]}'),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
        child: Column(
            children: event.map((entry) {
          return GestureDetector(
            onTap: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (ctx, a1, a2) {
                  return Container();
                },
                transitionBuilder: (ctx, a1, a2, child) {
                  var curve = Curves.easeInOut.transform(a1.value);
                  return Transform.scale(
                    scale: curve,
                    child: _dialog(ctx, entry),
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              );

              // _scaleDialog(context);
            },
            child: Container(
              // fill: Fill.fillBack,
              // alignment: Alignment.center,
              // direction: FlipDirection.HORIZONTAL,
              // child:Container(
              margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              width: double.infinity,
              height: 70,
              child: Card(
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        "${entry["picture"]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '${entry["title"]}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
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

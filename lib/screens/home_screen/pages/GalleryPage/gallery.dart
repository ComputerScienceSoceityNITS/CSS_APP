import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'esperanza.dart';
import 'abacus.dart';
import 'package:cssapp/configs/configs.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool esperanzaSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: (MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width -
                MediaQuery.of(context).padding.top
            : MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                height: 200,
                child: AnimatedOpacity(
                  opacity: 0.7,
                  duration: const Duration(milliseconds: 10),
                  child: LottieBuilder(
                    lottie: Assets.lottieSingSong.lottie,
                    frameRate: FrameRate(1),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 63,
                            child: Card(
                              color: Pallet.accentColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "G",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontFamily: 'ExtraOrnamentalNo2',
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "ALLERY",
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: Text(
                      "Things end but \nMemories last forever",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 27,
                          //color: Colors.pinkAccent,
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'EastSeaDokdo'),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   width: 30,
                      // ),
                      GestureDetector(
                        onTap: () => setState(() {
                          esperanzaSelected = true;
                        }),
                        child: Text(
                          "Esperanza",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: esperanzaSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: esperanzaSelected
                                ? Pallet.accentColor
                                : Theme.of(context).backgroundColor,
                            fontFamily: 'Cormorant Unicase',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () => setState(() {
                          esperanzaSelected = false;
                        }),
                        child: Text(
                          "Abacus",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: esperanzaSelected
                                ? FontWeight.normal
                                : FontWeight.bold,
                            color: esperanzaSelected
                                ? Theme.of(context).backgroundColor
                                : Pallet.accentColor,
                            fontFamily: 'Cormorant Unicase',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? MediaQuery.of(context).size.width * 0.10
                        : MediaQuery.of(context).size.height * 0.55),
                    child:
                        esperanzaSelected ? const Esperanza() : const Abacus(),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

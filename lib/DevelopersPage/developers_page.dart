import 'package:cssapp/DevelopersPage/developers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cssapp/configs/configs.dart';

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({Key? key}) : super(key: key);

  @override
  State<DevelopersPage> createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: (MediaQuery.of(context).orientation == Orientation.landscape
                ? MediaQuery.of(context).size.width -
                    MediaQuery.of(context).padding.top
                : MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top),
            child: Stack(children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                          child: Container(
                              alignment: Alignment.topCenter,
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    height: 200,
                                    child: AnimatedOpacity(
                                      opacity: 0.7,
                                      duration:
                                          const Duration(milliseconds: 10),
                                      child: Assets.lottieTeam,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "OUR",
                                        style: TextStyle(
                                          fontSize: 39,
                                          color: Colors.white,
                                          fontFamily: 'Cormorant Unicase',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "team",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 40,
                                            fontFamily: 'Round Pop',
                                            fontWeight: FontWeight.bold,
                                            shadows: [
                                              const Shadow(
                                                  offset: Offset(3, 3),
                                                  color: Colors.black38,
                                                  blurRadius: 10),
                                              Shadow(
                                                  offset: const Offset(-3, -3),
                                                  color: const Color(0xFF923cb5)
                                                      .withOpacity(0.85),
                                                  blurRadius: 10)
                                            ]),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                        const Developers(),
                        const SizedBox(
                          height: 50,
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

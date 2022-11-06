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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
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
                            Text("team".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: textLargeSpaced),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          child: AnimatedOpacity(
                            opacity: 0.7,
                            duration: const Duration(milliseconds: 10),
                            child: Assets.lottieTeam,
                          ),
                        ),
                      ],
                    )),
              ),
              const Developers(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'developers.dart';
import 'package:flutter/material.dart';
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
                            Text(
                              "OUR",
                              style: TextStyle(
                                fontSize: 39,
                                color: Theme.of(context).backgroundColor,
                                fontFamily: 'Cormorant Unicase',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("team".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: textLargeSpaced.copyWith(
                                  color: Theme.of(context).backgroundColor,
                                )),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          child: AnimatedOpacity(
                            opacity: 1,
                            duration: const Duration(milliseconds: 10),
                            child: Assets.lottieTeam,
                          ),
                        ),
                      ],
                    )),
              ),
              const Developers(),
            ],
          ),
        ),
      ),
    );
  }
}

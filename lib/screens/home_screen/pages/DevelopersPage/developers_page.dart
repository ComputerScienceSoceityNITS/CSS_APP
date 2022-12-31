import 'package:cssapp/utils/storage_handler.dart';

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
        child: Stack(children: [
          !StorageHandler().isDarkTheme()
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.3, 0.7, 0.8, 1],
                      colors: [
                        Color.fromARGB(138, 255, 64, 128),
                        Color.fromARGB(125, 231, 186, 186),
                        Color.fromARGB(170, 94, 144, 231),
                        Color.fromARGB(132, 96, 125, 139),
                        Color.fromARGB(170, 255, 64, 128)
                      ],
                    ),
                  ),
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                ),
          SingleChildScrollView(
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
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

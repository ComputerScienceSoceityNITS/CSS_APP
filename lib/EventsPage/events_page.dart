import 'package:cssapp/EventsPage/culture_events.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'techno_events.dart';
import 'package:cssapp/configs/configs.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool technoEventsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: (MediaQuery.of(context).orientation == Orientation.landscape
            ? MediaQuery.of(context).size.width -
                MediaQuery.of(context).padding.top
            : MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 200,
                      child: AnimatedOpacity(
                        opacity: 0.7,
                        duration: const Duration(milliseconds: 10),
                        child: Lottie.asset(
                          Paths.lottieAccounting,
                          frameRate: FrameRate(2),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.fromLTRB(0, 100, 40, 0),
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                border:
                                    Border.all(width: 0.5, color: Colors.grey)),
                            child: const Center(
                              child: Text(
                                "CSS",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Geostar Fill',
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            width: 100,
                            height: 50,
                          ),
                        ),
                        Container(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 66,
                                  child: Card(
                                    color: const Color(0xFFBC4E9C),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "E",
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
                                const Text(
                                  "VENTS",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: const EdgeInsets.all(7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Participate",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Italianno',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Enjoy",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFFBC4E9C),
                                  fontFamily: 'Italianno',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Learn",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'Italianno',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        technoEventsSelected = true;
                      }),
                      child: Text(
                        "Techno Events",
                        style: TextStyle(
                          fontSize: 20,
                          color: technoEventsSelected
                              ? const Color(0xFFBC4E9C)
                              : Colors.white,
                          fontFamily: 'Cormorant Unicase',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        technoEventsSelected = false;
                      }),
                      child: Text(
                        "Cultural Events",
                        style: TextStyle(
                          fontSize: 20,
                          color: technoEventsSelected
                              ? Colors.white
                              : const Color(0xFFBC4E9C),
                          fontFamily: 'Cormorant Unicase',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                technoEventsSelected
                    ? const TechnoEvents()
                    : const CultureEvents(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

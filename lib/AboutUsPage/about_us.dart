import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
          child: Builder(builder: (context) {
            return FloatingActionButton(
              elevation: 12,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 33,
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }),
        ),
        backgroundColor: Colors.black,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: 
            [SizedBox(
              height: (MediaQuery.of(context).orientation == Orientation.landscape
                  ? double.infinity
                  : MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top),
              child: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Column(children: [
                          Padding(
                      padding: const EdgeInsets.fromLTRB(30, 100, 0, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Computer',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.1),
                                  fontSize: 70,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Science',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.1),
                                  fontSize: 70,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Society',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.1),
                                  fontSize: 70,
                                  fontFamily: 'Anton',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Column(
                          children: [
                                const Text(
                                    "ABOUT CSS",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.w400),
                                  ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 35, 8, 8),
                                  child: Text(
                                    "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. With thousands of members on Facebook, Discord and the like, we strive relentlessly to help them reach the zenith of all-round excellence, and then beyond. ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
                                  child: Text(
                                    "All the wings of our society- Executive, CP, Dev, ML, Literary and design, work hand in hand to organize a plethora of exciting and diverse events. While Enigma, Abacus-tec, CSS wars, CSS Hacks and numerous talks and seminars with distinguished personalities set the bar for technical discourse in the college; cultural events like Esperanza, along with various sports tourneys, provide everyone with a sense of brotherhood and much-needed recreation.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
                                  child: Text(
                                    "Contact",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 8, 3),
                                  child: Text(
                                    "CSS, NIT Silchar,",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 8, 3),
                                  child: Text(
                                    "Silchar, Assam",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                                  child: Text(
                                    "788010",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
                                  child: Text(
                                    "Socials",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(2, 0, 8, 0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                                              child: Tab(icon: Image.asset("assets/CSS_logo_light.png", width: 40, height: 30, fit: BoxFit.cover,),),
                                                              onTap: () => launch(
                                                                  'https://nitscss.live/'),
                                                            ),
                                      const SizedBox(width: 10,),
                                      InkWell(child: const Text("CSS Website", style: TextStyle(color: Colors.white, fontSize: 17),), onTap: () => launch(
                                                                  'https://nitscss.live/'),),
                                    ],
                                  ),
                                ),
                                //Tab(icon: Image.asset("assets/Css_logo.png"),),
                                //https://css-2-0.vercel.app/
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 3),
                                  child: Row(
                                    children: [
                                      InkWell(
                                                              child: const Icon(Icons
                                                                  .facebook, color: Colors.white, size: 30,),
                                                              onTap: () => launch(
                                                                  'https://www.facebook.com/groups/186753138074295'),
                                                            ),
                                      const SizedBox(width: 13,),
                                      InkWell(child: const Text("Facebook", style: TextStyle(color: Colors.white, fontSize: 17),), onTap: () => launch(
                                                                  'https://www.facebook.com/groups/186753138074295'),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                                  child: Row(
                                    children: [
                                      InkWell(
                                                              child: const Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 30,),
                                                              onTap: () => launch(
                                                                  'https://www.youtube.com/channel/UC8tCBXmdKueuFODn_IngQrg'),
                                                            ),
                                      const SizedBox(width: 13,),
                                      InkWell(child: const Text("Youtube", style: TextStyle(color: Colors.white, fontSize: 17),), onTap: () => launch(
                                                                  'https://www.youtube.com/channel/UC8tCBXmdKueuFODn_IngQrg'),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 10),
                                  child: Text(
                                    "©2021 Computer Science Society. All Rights Reserved",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Anton',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

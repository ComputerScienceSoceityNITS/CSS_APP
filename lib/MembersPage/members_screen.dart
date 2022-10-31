import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import '../Models/api_call.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  var dropdownValue = "21-22";

  static List<String> wings = [
    "heads",
    "devWing",
    "cpWing",
    "executiveWing",
    "mlWing",
    "designWing",
    "literaryWing",
    "technical"
  ];

  static var items = ["19-20", "20-21", "21-22"];
  static var _year_map = {
    "19-20": Api.members_20,
    "20-21": Api.members_21,
    "21-22": Api.members_22,
  };
  @override
  void initState() {
    super.initState();
    _posts = Api.members_22;
  }

  static Map _posts = Api.members_22 as Map;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "MEMBERS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontFamily: 'Round Pop',
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              offset: Offset(3, 3),
                              color: Colors.black38,
                              blurRadius: 10),
                          Shadow(
                              offset: Offset(-3, -3),
                              color: Color(0xFFBC4E9C).withOpacity(0.7),
                              blurRadius: 10)
                        ]),
                  ),
                ),
                SizedBox(
                  width: 17,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      // padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      // margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 4)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          iconSize: 10,
                          elevation: 24,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              _posts = _year_map[newValue] as Map;
                            });
                          },
                          value: dropdownValue,
                          items: items.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Color(0xFFBC4E9C)),
                                  ));
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: (wings).map((e) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            (_posts[e] as List).isNotEmpty
                                ? Container(
                                    height: 300,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 6),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.toString().toUpperCase(),
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25,
                                                fontFamily: 'Commorant Unicase',
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  Shadow(
                                                      offset: Offset(3, 3),
                                                      color: Colors.black38,
                                                      blurRadius: 10),
                                                  Shadow(
                                                      offset: Offset(-1, -1),
                                                      color: Color(0xFFBC4E9C)
                                                          .withOpacity(0.85),
                                                      blurRadius: 10)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            (e.toString() != "heads")
                                                ? Text(
                                                    "MEMBERS",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 25,
                                                        fontFamily:
                                                            'Commorant Unicase',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        shadows: [
                                                          Shadow(
                                                              offset:
                                                                  Offset(3, 3),
                                                              color: Colors
                                                                  .black38,
                                                              blurRadius: 10),
                                                          Shadow(
                                                              offset: Offset(
                                                                  -1, -1),
                                                              color: Color(
                                                                      0xFFBC4E9C)
                                                                  .withOpacity(
                                                                      0.85),
                                                              blurRadius: 10)
                                                        ]),
                                                  )
                                                : Text(""),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Row(
                                    children: (_posts[e] as List).map((entry) {
                                      return Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 250,
                                              width: 200,
                                              child: Card(
                                                elevation: 20,
                                                semanticContainer: true,
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child:
                                                    Image.network("${entry.pic}",
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  }
                                                  return LoadingIndicator(
                                                      indicatorType:
                                                          Indicator.ballPulse,
                                                      colors: const [
                                                        Colors.white
                                                      ],
                                                      strokeWidth: 1,
                                                      backgroundColor:
                                                          Colors.black,
                                                      pathBackgroundColor:
                                                          Colors.black);
                                                }, fit: BoxFit.cover),
                                              ),
                                            ),
                                            Positioned.fill(
                                              bottom: 3,
                                              child: Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Container(
                                                  height: 73,
                                                  width: 195,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFBC4E9C)
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    75.0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15.0)),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: Text(
                                                          '${entry.role}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                right: 8),
                                                        child: Text(
                                                          '${entry.name}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        ),
                                                      ),
                                                      (entry.session.toString() !=
                                                              "19-20")
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          0),
                                                                  child: InkWell(
                                                                    child: Icon(
                                                                      Icons
                                                                          .facebook,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 15,
                                                                    ),
                                                                    onTap: () =>
                                                                        launch(
                                                                            '${entry.fb}'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          0),
                                                                  child: InkWell(
                                                                    child: Icon(
                                                                      FontAwesomeIcons
                                                                          .github,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 15,
                                                                    ),
                                                                    onTap: () =>
                                                                        launch(
                                                                            '${entry.git}'),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          0),
                                                                  child: InkWell(
                                                                    child: Icon(
                                                                      FontAwesomeIcons
                                                                          .linkedin,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 15,
                                                                    ),
                                                                    onTap: () =>
                                                                        launch(
                                                                            '${entry.link}'),
                                                                  ),
                                                                ),
                                                                (entry.session
                                                                            .toString() ==
                                                                        "21-22")
                                                                    ? Padding(
                                                                        padding:
                                                                            const EdgeInsets.fromLTRB(
                                                                                8,
                                                                                8,
                                                                                8,
                                                                                0),
                                                                        child:
                                                                            InkWell(
                                                                          child:
                                                                              Icon(
                                                                            FontAwesomeIcons
                                                                                .instagram,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                          onTap: () =>
                                                                              launch('${entry.insta}'),
                                                                        ),
                                                                      )
                                                                    : Container(),
                                                              ],
                                                            )
                                                          : Container(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  // (e.toString() == "literaryWing" ||
                                  //         e.toString() == "technical" ||  e.toString() == "designWing")
                                  //     ? SizedBox(height: 50)
                                  //     : SizedBox(
                                  //         height: 0,
                                  //       ),
                                        SizedBox(height: 50),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

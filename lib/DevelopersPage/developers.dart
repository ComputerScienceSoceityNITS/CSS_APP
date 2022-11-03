import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/api_call.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:cssapp/configs/configs.dart';

class Developers extends StatefulWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  _DevelopersState createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
  var dropdownValue = "21-22";

  static var items = ["20-21", "21-22"];
  static var _year_map = {
    "20-21": Api.members_21,
    "21-22": Api.members_22,
  };
  @override
  void initState() {
    super.initState();
    _posts = Api.members_22;
  }

  static Map _posts = Api.members_22 as Map;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 10),
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
                                  style:
                                      const TextStyle(color: Color(0xFFBC4E9C)),
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
            child: Column(
              children: (_posts["devWing"] as List).map((entry) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 250,
                          width: 200,
                          child: Card(
                            elevation: 20,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network("${entry.pic}", loadingBuilder:
                                (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return const LoadingIndicator(
                                  indicatorType: Indicator.ballPulse,
                                  colors: [Colors.white],
                                  strokeWidth: 1,
                                  backgroundColor: Colors.black,
                                  pathBackgroundColor: Colors.black);
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
                                color: const Color(0xFFBC4E9C).withOpacity(0.7),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(75.0),
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${entry.role}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      '${entry.name}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 0),
                                        child: InkWell(
                                          child: const Icon(
                                            Icons.facebook,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          onTap: () => launch('${entry.fb}'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 0),
                                        child: InkWell(
                                          child: const Icon(
                                            FontAwesomeIcons.github,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          onTap: () => launch('${entry.git}'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 0),
                                        child: InkWell(
                                          child: const Icon(
                                            FontAwesomeIcons.linkedin,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          onTap: () => launch('${entry.link}'),
                                        ),
                                      ),
                                      entry.session == "21-22"
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 8, 0),
                                              child: InkWell(
                                                child: Icon(
                                                  FontAwesomeIcons.instagram,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                onTap: () =>
                                                    launch('${entry.insta}'),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

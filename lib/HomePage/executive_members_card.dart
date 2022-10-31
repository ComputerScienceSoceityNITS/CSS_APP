import 'package:flutter/material.dart';

class Executivemembers extends StatelessWidget {
  var members = [
    {
      "title": "CONVENER",
      "picture": "assets/framers/MajhiSir.jpeg",
      "name": "Mr. Umakanta majhi",
      "details": "Assistant Professor",
      "email": "umakanta@cse.nits.ac.in"
    },
    {
      "title": "GENERAL SECRETARY",
      "picture": "assets/framers/Samiksha_Kulkarni.jpeg",
      "name": "Samiksha Kulkarni",
      "details": "+91 6000844282",
      "email": ""
    },
    {
      "title": "TECHNICAL HEAD",
      "picture": "assets/framers/Abhishek_Kumar_Jha.jpg",
      "name": "Abhishek Kumar Jha",
      "details": "+91 9101810767",
      "email": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
      child: Column(
          children: members.map((entry) {
        return Container(
          margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
          width: 300,
          height: 300,
          child: Card(
            color: const Color(0xFF111111),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("${entry["picture"]}"),
                                fit: BoxFit.cover),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 40,
                        width: 200,
                        child: Card(
                            color: const Color(0xFFBC4E9C),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                '${entry["title"]}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 70,
                        width: 200,
                        child: Column(children: [
                          Text(
                            '${entry["name"]}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${entry["details"]}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '${entry["email"]}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList()),
    ));
  }
}

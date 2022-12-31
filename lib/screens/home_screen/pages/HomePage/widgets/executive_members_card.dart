import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExecutiveMembers extends StatelessWidget {
  const ExecutiveMembers({Key? key}) : super(key: key);

  static final List<_ExecutiveMember> members = [
    _ExecutiveMember(
      title: "CONVENER",
      img: Assets.framerMajhiSir,
      name: "Mr. Umakanta majhi",
      details: "Assistant Professor",
      email: "umakanta@cse.nits.ac.in",
      facebook_link: "https://www.google.com/",
      github_link: "https://www.google.com/",
      linkedin_link: "https://www.google.com/",
    ),
    _ExecutiveMember(
      title: "GENERAL SECRETARY",
      img: Assets.framerSamikshaKulkarni,
      name: "Samiksha Kulkarni",
      details: "+91 6000844282",
      email: "",
      facebook_link: "https://www.google.com/",
      github_link: "https://www.google.com/",
      linkedin_link: "https://www.google.com/",
    ),
    _ExecutiveMember(
      title: "TECHNICAL HEAD",
      img: Assets.framerAbhishekKumarJha,
      name: "Abhishek Kumar Jha",
      details: "+91 9101810767",
      email: "",
      facebook_link: "https://www.google.com/",
      github_link: "https://www.google.com/",
      linkedin_link: "https://www.google.com/",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
      child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: members.map((_ExecutiveMember entry) {
            return entry.card(context);
          }).toList()),
    ));
  }
}

class _ExecutiveMember {
  final String title;
  final Image img;
  final String name;
  final String details;
  final String email;
  final String? facebook_link;
  final String? linkedin_link;
  final String? github_link;

  const _ExecutiveMember({
    required this.title,
    required this.img,
    required this.name,
    required this.details,
    required this.email,
    required this.facebook_link,
    required this.linkedin_link,
    required this.github_link,
  });

  Widget card(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      width: 270,
      height: 335,
      child: Card(
        shadowColor: Colors.black,
        elevation: 10,
        color: Theme.of(context).canvasColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                      Container(
                        width: 110,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: img.image, fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width: 5,
                        height: 100,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: 200,
              child: Card(
                elevation: 5,
                color: Pallet.accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textSmallBold.copyWith(
                        color: Theme.of(context).backgroundColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Text(name,
                      textAlign: TextAlign.center,
                      style: textSmall.copyWith(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold)),
                  Text(details,
                      textAlign: TextAlign.center,
                      style: textSmall.copyWith(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold)),
                  Text(email,
                      textAlign: TextAlign.center,
                      style: textSmall.copyWith(
                          color: Theme.of(context).backgroundColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () => launch(facebook_link ?? ''),
                    icon: Icon(Icons.facebook),
                  ),
                  IconButton(
                    onPressed: () => launch(linkedin_link ?? ' '),
                    icon: Icon(FontAwesomeIcons.linkedin),
                  ),
                  IconButton(
                      onPressed: () => launch(github_link ?? ' '),
                      icon: title == 'CONVENER'
                          ? Icon(FontAwesomeIcons.bookOpenReader)
                          : Icon(FontAwesomeIcons.github))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

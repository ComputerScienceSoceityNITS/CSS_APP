import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

class ExecutiveMembers extends StatelessWidget {
  const ExecutiveMembers({Key? key}) : super(key: key);

  static final List<_ExecutiveMember> members = [
    _ExecutiveMember(
        title: "CONVENER",
        img: Assets.framerMajhiSir,
        name: "Mr. Umakanta majhi",
        details: "Assistant Professor",
        email: "umakanta@cse.nits.ac.in"),
    _ExecutiveMember(
        title: "GENERAL SECRETARY",
        img: Assets.framerSamikshaKulkarni,
        name: "Samiksha Kulkarni",
        details: "+91 6000844282",
        email: ""),
    _ExecutiveMember(
        title: "TECHNICAL HEAD",
        img: Assets.framerAbhishekKumarJha,
        name: "Abhishek Kumar Jha",
        details: "+91 9101810767",
        email: ""),
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
            return entry.card();
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

  const _ExecutiveMember(
      {required this.title,
      required this.img,
      required this.name,
      required this.details,
      required this.email});

  Widget card() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      width: 270,
      height: 300,
      child: Card(
        color: Pallet.darkCardBGColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: img.image, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: 200,
              child: Card(
                color: Pallet.accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textSmallBold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Text(name, textAlign: TextAlign.center, style: textSmall),
                  Text(details, textAlign: TextAlign.center, style: textSmall),
                  Text(email, textAlign: TextAlign.center, style: textSmall),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

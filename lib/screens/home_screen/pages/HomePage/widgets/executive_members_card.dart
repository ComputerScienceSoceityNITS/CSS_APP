import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

import 'executive_member_bottom_sheet.dart';

// TODO: WORK LEFT
class ExecutiveMembers extends StatelessWidget {
  const ExecutiveMembers({Key? key}) : super(key: key);

  static final List<_ExecutiveMember> members = [
    _ExecutiveMember(
      title: "CONVENER",
      img: Assets.framerMajhiSir,
      name: "Mr. Umakanta majhi",
      details: "Assistant Professor",
      email: "umakanta@cse.nits.ac.in",
      faceBook: "https://www.facebook.com/bdlsni123",
      linkedin: "https://www.linkedin.com/in/umakanta-majhi-43238576",
      professorProfile: "http://cs.nits.ac.in/uma/",
    ),
    _ExecutiveMember(
      title: "GENERAL SECRETARY",
      img: Assets.framerSamikshaKulkarni,
      name: "Samiksha Kulkarni",
      details: "+91 6000844282",
      email: "",
      faceBook: "https://www.facebook.com/samiksha.kulkarni.5201",
      linkedin: "https://www.linkedin.com/in/samiksha-kulkarni-aa5015185/",
      gitHub: "https://github.com/samiksha0408",
    ),
    _ExecutiveMember(
      title: "TECHNICAL HEAD",
      img: Assets.framerAbhishekKumarJha,
      name: "Abhishek Kumar Jha",
      details: "+91 9101810767",
      email: "",
      faceBook: "https://www.facebook.com/kehsihba19",
      linkedin: "https://www.linkedin.com/in/kehsihba19/",
      gitHub: "https://github.com/kehsihba19",
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
  final String faceBook;
  final String linkedin;
  String? gitHub;
  String? professorProfile;
  final double profileHeight = 120;

  _ExecutiveMember({
    required this.title,
    required this.img,
    required this.name,
    required this.details,
    required this.email,
    required this.faceBook,
    required this.linkedin,
    this.gitHub,
    this.professorProfile,
  });

  Widget card(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          isScrollControlled: true,
          builder: ((context) {
            return ExecutiveMemberBottomSheet(
              role: title,
              name: name,
              details: details,
              faceBook: faceBook,
              linkedIn: linkedin,
              gitHub: gitHub,
              professorProfile: professorProfile,
            );
          }),
        );
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: 270,
        height: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: profileHeight * 0.75,
                      height: profileHeight * 0.7,
                      color: Theme.of(context).backgroundColor,
                    ),
                    Container(
                      width: profileHeight * 0.65,
                      height: profileHeight,
                      margin: EdgeInsets.only(top: profileHeight * 0.05),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: img.image, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                )),
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
                    style: textSmallBold.copyWith(
                      color: Colors.white,
                    ),
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
                  Text(name,
                      textAlign: TextAlign.center,
                      style: textSmall.copyWith(
                          color: Theme.of(context).backgroundColor)),
                  Text(details,
                      textAlign: TextAlign.center,
                      style: textSmall.copyWith(
                          color: Theme.of(context).backgroundColor)),
                  Text(email,
                      textAlign: TextAlign.center,
                      style: textSmall.copyWith(
                          color: Theme.of(context).backgroundColor)),
                  Container(
                    height: 1,
                    width: 200,
                    color: Theme.of(context).backgroundColor.withOpacity(0.5),
                  ),
                  Text(
                    'Click to Connect',
                    style: textSmall.copyWith(color: Pallet.accentColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

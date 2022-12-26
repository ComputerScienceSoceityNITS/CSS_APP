import 'package:cssapp/widgets/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'executive_member_bottomSheet.dart';

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
      LinkedIn: "https://www.linkedin.com/in/umakanta-majhi-43238576",
      professorProfile: "http://cs.nits.ac.in/uma/",
    ),
    _ExecutiveMember(
      title: "GENERAL SECRETARY",
      img: Assets.framerSamikshaKulkarni,
      name: "Samiksha Kulkarni",
      details: "+91 6000844282",
      email: "",
      faceBook: "https://www.facebook.com/samiksha.kulkarni.5201",
      LinkedIn: "https://www.linkedin.com/in/samiksha-kulkarni-aa5015185/",
      gitHub: "https://github.com/samiksha0408",
    ),
    _ExecutiveMember(
      title: "TECHNICAL HEAD",
      img: Assets.framerAbhishekKumarJha,
      name: "Abhishek Kumar Jha",
      details: "+91 9101810767",
      email: "",
      faceBook: "https://www.facebook.com/kehsihba19",
      LinkedIn: "https://www.linkedin.com/in/kehsihba19/",
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
  final String LinkedIn;
  String? gitHub;
  String? professorProfile;

  _ExecutiveMember({
    required this.title,
    required this.img,
    required this.name,
    required this.details,
    required this.email,
    required this.faceBook,
    required this.LinkedIn,
    this.gitHub,
    this.professorProfile,
  });

  Widget card(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
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
              LinkedIn: LinkedIn,
              gitHub: gitHub,
              professorProfile: professorProfile,
            );
          }),
        );
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        width: 270,
        height: 300,
        child: Card(
          color: Theme.of(context).canvasColor,
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
                      style: textSmallBold.copyWith(
                        color: Theme.of(context).canvasColor,
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
      ),
    );
  }
}


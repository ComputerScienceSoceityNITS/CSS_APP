// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

import '../../../../../widgets/member_connect_slide_up.dart';
import 'executive_member_bottom_sheet.dart';

// ignore: todo
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
      title: "TECHNICAL HEAD",
      img: Assets.framerSourabhShah,
      name: "Sourabh Shah",
      details: "+91-7033571910",
      email: "",
      faceBook: "https://www.facebook.com/sourab579/",
      linkedin: "https://www.linkedin.com/in/sourabh-shah-1b6225192/",
      gitHub: "https://github.com/SRV1030",
    ),
    _ExecutiveMember(
      title: "GENERAL SECRETARY",
      img: Assets.framerAbhishekBharadwaz,
      name: "Abhishek Bharadwaz",
      details: "+91-7636012703",
      email: "",
      faceBook: "https://www.facebook.com/bharadwaz.abhishek/",
      insta: "https://www.instagram.com/bharadwaz_abhishek/",
      linkedin: "https://www.linkedin.com/in/abhishek-bharadwaz/",
      gitHub: "https://github.com/4Marsha1",
    ),
    _ExecutiveMember(
      title: "PRESIDENT",
      img: Assets.framerTeresaLouis,
      name: "Teresa Louis",
      details: "+91-7002375113",
      email: "",
      faceBook: "https://www.facebook.com/teresa.louis1",
      linkedin: "https://www.linkedin.com/in/teresa-louis-80974b1a0/",
      gitHub: "https://github.com/tracyber",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        children: members,
      ),
    );
  }
}

class _ExecutiveMember extends StatelessWidget {
  final String title;
  final Image img;
  final String name;
  final String? details;
  final String? email;
  final String? faceBook;
  final String? linkedin;
  final String? insta;
  final String? gitHub;
  final String? professorProfile;
  final double profileHeight = 120;
  const _ExecutiveMember({
    Key? key,
    required this.title,
    required this.img,
    required this.name,
    this.details,
    this.email,
    this.faceBook,
    this.linkedin,
    this.insta,
    this.gitHub,
    this.professorProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          builder: (context) => SingleChildScrollView(
            child: ConnectMember(
              role: title,
              name: name,
              fb: faceBook,
              git: gitHub,
              insta: insta,
              linkedin: linkedin,
            ),
          ),
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
                      width: profileHeight * 1.06,
                      height: profileHeight * 0.8,
                      color: Theme.of(context).backgroundColor,
                    ),
                    Container(
                      width: profileHeight * 0.9,
                      height: profileHeight * 1.1,
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
                      fontSize: 18,
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
                spacing: 6,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  details != null && details!.isNotEmpty
                      ? Text(details ?? '',
                          textAlign: TextAlign.center,
                          style: textSmall.copyWith(
                              color: Theme.of(context).backgroundColor))
                      : const SizedBox.shrink(),
                  email != null && email!.isNotEmpty
                      ? Text(email ?? '',
                          textAlign: TextAlign.center,
                          style: textSmall.copyWith(
                              color: Theme.of(context).backgroundColor))
                      : const SizedBox.shrink(),
                  Container(
                    height: 1,
                    width: 200,
                    color: Theme.of(context).backgroundColor.withOpacity(0.5),
                  ),
                  Text(
                    'Click to Connect',
                    style: textSmall.copyWith(
                        color: Pallet.accentColor, fontSize: 15),
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

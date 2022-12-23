import 'package:cssapp/widgets/bottomSheetControllerBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../configs/configurations/pallet.dart';
import '../../../../../configs/text_style.dart';
import '../../../../../widgets/social_icons.dart';

class ExecutiveMemberBottomSheet extends StatelessWidget {
  final String role;
  final String name;
  final String details;
  final String faceBook;
  final String LinkedIn;
  String? gitHub;
  String? professorProfile;

  ExecutiveMemberBottomSheet({
    required this.role,
    required this.name,
    required this.details,
    required this.faceBook,
    required this.LinkedIn,
    this.gitHub,
    this.professorProfile,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BottomSheetControllerBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 45,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "EXECUTIVE MEMBER",
                    style: textSmallBold.copyWith(
                      color: Theme.of(context).backgroundColor,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Pallet.accentColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        role,
                        style: textSmallBold.copyWith(
                          color: Theme.of(context).canvasColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    details,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    spacing: 60,
                    children: [
                      SocialIcons(
                        size: 30,
                        icon: FontAwesomeIcons.facebook,
                        link: faceBook,
                      ),
                      SocialIcons(
                        size: 30,
                        icon: FontAwesomeIcons.linkedinIn,
                        link: LinkedIn,
                      ),
                      SocialIcons(
                        icon: (professorProfile == null)
                            ? FontAwesomeIcons.github
                            : FontAwesomeIcons.bookOpen,
                        size: 30,
                        link:
                            (professorProfile == null) ? gitHub : professorProfile,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

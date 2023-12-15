import 'package:cssapp/widgets/bottom_sheet_controller_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/widgets/social_icons.dart';

class ExecutiveMemberBottomSheet extends StatelessWidget {
  final String role;
  final String name;
  final String details;
  final String faceBook;
  final String linkedIn;
  final String? gitHub;
  final String? professorProfile;

  const ExecutiveMemberBottomSheet({
    Key? key,
    required this.role,
    required this.name,
    required this.details,
    required this.faceBook,
    required this.linkedIn,
    this.gitHub,
    this.professorProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BottomSheetControllerBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "EXECUTIVE MEMBER",
                  style: textSmallBold.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 40),
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  details,
                ),
                const SizedBox(height: 40),
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
                      link: linkedIn,
                    ),
                    SocialIcons(
                      icon: (professorProfile == null)
                          ? FontAwesomeIcons.github
                          : FontAwesomeIcons.bookOpen,
                      size: 30,
                      link: (professorProfile == null)
                          ? gitHub
                          : professorProfile,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

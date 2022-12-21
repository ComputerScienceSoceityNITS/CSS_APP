// ignore_for_file: unused_import, unused_shown_name, unnecessary_this, unrelated_type_equality_checks

import 'package:cssapp/configs/configs.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

import 'social_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cssapp/state_handlers/members/member_api.dart'
    show Role, Session;
import 'package:cached_network_image/cached_network_image.dart';

class ConnectMember extends StatelessWidget {
  final String imageLink;
  final String role;
  final String name;
  final Session session;
  final String? fb;
  final String? git;
  final String? linkedin;
  final String? insta;
  const ConnectMember(
      {Key? key,
      required this.imageLink,
      required this.role,
      required this.name,
      required this.session,
      this.fb,
      this.git,
      this.linkedin,
      this.insta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        height: 4,
        width: 100,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(2)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 78.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                this.name,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              Container(
                height: 1,
                width: 200,
                color: Theme.of(context).backgroundColor.withOpacity(0.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(this.role),
              const SizedBox(
                height: 30,
              ),
              if (fb != Null ||
                  git != Null ||
                  linkedin != Null ||
                  insta != Null)
                Wrap(
                  spacing: 50,
                  children: [
                    if (fb != Null)
                      SocialIcons(
                        icon: FontAwesomeIcons.facebook,
                        link: fb,
                        size: 30,
                      ),
                    if (git != Null)
                      SocialIcons(
                        icon: FontAwesomeIcons.github,
                        link: git,
                        size: 30,
                      ),
                    if (linkedin != Null)
                      SocialIcons(
                        icon: FontAwesomeIcons.linkedin,
                        link: insta,
                        size: 30,
                      ),
                    if (insta != Null)
                      SocialIcons(
                        icon: FontAwesomeIcons.instagram,
                        link: insta,
                        size: 30,
                      ),
                  ],
                )
            ],
          ),
        ),
      ),
    ]);
  }
}

// ignore_for_file: unused_import, unused_shown_name

import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/widgets/head_name_card.dart';
import 'package:cssapp/widgets/member_connect_slide_up.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

import 'social_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cssapp/state_handlers/members/member_api.dart'
    show Role, Session;
import 'package:cached_network_image/cached_network_image.dart';

class HeadMemberCard extends StatelessWidget {
  final String imageLink;
  final String role;
  final String name;
  final Session session;
  final String? fb;
  final String? git;
  final String? linkedin;
  final String? insta;
  const HeadMemberCard(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: GestureDetector(
        onTap: () {
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
                role: role,
                name: name,
                fb: fb,
                git: git,
                insta: insta,
                linkedin: linkedin,
              ),
            ),
          );
        },
        child: HeadNameCard(imageLink: imageLink, role: role, name: name),
      ),
    );
  }
}


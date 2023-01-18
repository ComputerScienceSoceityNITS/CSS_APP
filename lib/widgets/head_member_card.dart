// ignore_for_file: unused_import, unused_shown_name

import 'package:cssapp/configs/configs.dart';
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
        child: NameCard(imageLink: imageLink, role: role, name: name),
      ),
    );
  }
}

class NameCard extends StatelessWidget {
  const NameCard({
    Key? key,
    required this.imageLink,
    required this.role,
    required this.name,
  }) : super(key: key);

  final String imageLink;
  final String role;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 220,
              height: 270,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  imageLink.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: FadeShimmer(
                            height: 7,
                            width: 60,
                            radius: 4,
                            highlightColor: Color(0xffc0c3d3),
                            baseColor: Color(0xff999aa1),
                          ),
                        )
                      : Text(
                          role,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontSize: 10,
                          ),
                        ),
                  const SizedBox(height: 4),
                  imageLink.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: FadeShimmer(
                            height: 7,
                            width: 100,
                            radius: 4,
                            highlightColor: Color(0xffc0c3d3),
                            baseColor: Color(0xff999aa1),
                          ),
                        )
                      : Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                  const SizedBox(height: 7),
                  imageLink.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: FadeShimmer(
                            height: 40,
                            width: 140,
                            radius: 4,
                            highlightColor: Color.fromARGB(255, 241, 101, 201),
                            baseColor: Pallet.accentColor,
                          ),
                        )
                      : Container(
                          width: 140,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 2,
                                offset: const Offset(0, 3),
                                color: Colors.black.withOpacity(0.2),
                              )
                            ],
                            color: Pallet.accentColor,
                          ),
                          child: const Text(
                            "Click to Connect",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: imageLink.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: FadeShimmer(
                            height: 200,
                            width: 180,
                            radius: 4,
                            highlightColor: Color(0xffc0c3d3),
                            baseColor: Color(0xff999aa1),
                          ),
                        ):SizedBox(
              width: 180,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: SizedBox(
                      height: 200,
                      width: 210,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: CachedNetworkImageProvider(imageLink),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
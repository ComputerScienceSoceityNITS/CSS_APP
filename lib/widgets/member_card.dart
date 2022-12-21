// ignore_for_file: unused_shown_name

import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/widgets/member_connect_slide_up.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

import 'social_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cssapp/state_handlers/members/member_api.dart'
    show Role, Session;
import 'package:cached_network_image/cached_network_image.dart';

class MemberCard extends StatelessWidget {
  final String imageLink;
  final String role;
  final String name;
  final Session session;
  final String? fb;
  final String? git;
  final String? linkedin;
  final String? insta;
  const MemberCard(
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
    return imageLink.isEmpty
        ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FadeShimmer(
              height: 250,
              width: 200,
              radius: 4,
              highlightColor: Color(0xffc0c3d3),
              baseColor: Color(0xff999aa1),
            ),
          )
        : GestureDetector(
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
                    imageLink: imageLink,
                    role: role,
                    name: name,
                    session: session,
                    fb: fb,
                    git: git,
                    insta: insta,
                    linkedin: linkedin,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: 200,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image(
                      image: CachedNetworkImageProvider(imageLink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 3,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 75,
                      width: 195,
                      decoration: BoxDecoration(
                        color: Pallet.accentColor.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(75.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              role,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(height: 10),
                          if (fb != null ||
                              git != null ||
                              linkedin != null ||
                              insta != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Wrap(
                                spacing: 10,
                                children: [
                                  if (fb != null)
                                    SocialIcons(
                                        link: fb,
                                        icon: FontAwesomeIcons.facebook),
                                  if (git != null)
                                    SocialIcons(
                                        link: git,
                                        icon: FontAwesomeIcons.github),
                                  if (linkedin != null)
                                    SocialIcons(
                                        link: linkedin,
                                        icon: FontAwesomeIcons.linkedin),
                                  if (insta != null)
                                    SocialIcons(
                                        link: insta,
                                        icon: FontAwesomeIcons.instagram)
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

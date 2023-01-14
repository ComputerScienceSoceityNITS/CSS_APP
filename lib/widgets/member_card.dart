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
        : Padding(
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
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Pallet.accentColor, width: 3),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: SizedBox(
                      height: 250,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image(
                          image: CachedNetworkImageProvider(imageLink),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 75,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                role,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                height: 0.5,
                                width: 140,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "Click to Connect",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

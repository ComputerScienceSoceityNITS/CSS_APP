import 'member_card.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class MembersScroll extends StatelessWidget {
  final Map<String, List> posts;
  final String wing;
  const MembersScroll({Key? key, required this.posts, required this.wing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (posts[wing] != null && posts[wing]!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 10, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(wing.toUpperCase(),
                        textAlign: TextAlign.justify, style: textSmallBold),
                    const SizedBox(width: 10),
                    if (wing.toLowerCase() != "heads")
                      const Text("MEMBERS",
                          textAlign: TextAlign.left, style: textSmallBold)
                  ],
                ),
              ),
            const SizedBox(height: 20),
            if (posts[wing] != null && posts[wing]!.isNotEmpty)
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts[wing]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var entry = posts[wing]![index];
                    return MemberCard(
                        imageLink: entry.pic,
                        role: entry.role,
                        name: entry.name,
                        session: entry.session,
                        fb: entry.fb,
                        git: entry.git,
                        linkedin: entry.link,
                        insta: entry.insta);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

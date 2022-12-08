import 'package:cssapp/widgets/member_card.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/state_handlers/members/member.dart';
import 'package:cssapp/state_handlers/members/member_api.dart';

class MembersScroll extends StatelessWidget {
  final Map<Role, List<Member>>? posts;
  final Role wing;
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
            if (posts == null ||
                (posts![wing] != null && posts![wing]!.isNotEmpty))
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 10, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mapRole[wing] ?? '',
                        textAlign: TextAlign.justify,
                        style: textSmallBold.copyWith(
                            color: Theme.of(context).backgroundColor)),
                    const SizedBox(width: 10),
                    if (wing != Role.head)
                      Text("MEMBERS",
                          textAlign: TextAlign.left,
                          style: textSmallBold.copyWith(
                              color: Theme.of(context).backgroundColor))
                  ],
                ),
              ),
            const SizedBox(height: 20),
            if (posts == null ||
                (posts![wing] != null && posts![wing]!.isNotEmpty))
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts == null ? 5 : posts![wing]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Member? member = posts?[wing]![index];
                    return MemberCard(
                        imageLink: member?.imageLink ?? '',
                        role: member?.role ?? mapRole[Role.technical]!,
                        name: member?.name ?? '',
                        session: member?.session ?? Session.session_20_21,
                        fb: member?.fb,
                        git: member?.git,
                        linkedin: member?.linkedin,
                        insta: member?.insta);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

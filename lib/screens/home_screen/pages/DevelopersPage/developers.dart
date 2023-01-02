import 'dart:ui';

import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:cssapp/utils/storage_handler.dart';
import 'package:cssapp/widgets/head_member_card.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/state_handlers/members/member.dart';
import 'package:cssapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../configs/text_style.dart';

class Developers extends StatefulWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  _DevelopersState createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
  Session selectedSession = Session.session_21_22;
  Map members = {};

  Widget PositionHeading(BuildContext ctx, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: textLargeSpaced.copyWith(
            color: Theme.of(context).backgroundColor,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    members = Provider.of<MemberApi>(context, listen: false).members;
  }

  @override
  Widget build(BuildContext context) {
    Member technicalHead = members[selectedSession]![Role.head]?.firstWhere(
        (Member m) => m.role.toLowerCase().contains("technical head"));

    List<Member> devWingHeads = members[selectedSession]![Role.devWing]?.where(
      (Member m) {
        return m.role.toLowerCase().contains("head");
      },
    ).toList();

    List<Member> devWingMemberes =
        members[selectedSession]![Role.devWing]?.where(
      (Member m) {
        return !m.role.toLowerCase().contains("head");
      },
    ).toList();

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomDropDown(
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSession = reverseMapSession[newValue!]!;
                          });
                        },
                        items: Session.values
                            .map((session) => mapSession[session]!)
                            .toList(),
                        dropdownValue: mapSession[selectedSession],
                      ),
                    ),
                  ),
                ],
              ),
              PositionHeading(context, "Technical Head"),
              Container(
                child: members[selectedSession] == null
                    ? const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: MemberCard(
                          imageLink: '',
                          role: '',
                          name: 'name',
                          session: Session.session_21_22,
                        ),
                      )
                    : HeadMemberCard(
                        imageLink: technicalHead.imageLink,
                        role: technicalHead.role,
                        name: technicalHead.name,
                        session: technicalHead.session,
                        fb: technicalHead.fb,
                        git: technicalHead.git,
                        linkedin: technicalHead.linkedin,
                        insta: technicalHead.insta,
                      ),
              ),
              PositionHeading(context, "Dev Wing Heads"),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: members[selectedSession] == null
                      ? [
                          for (int i = 0; i < 5; i++)
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: MemberCard(
                                imageLink: '',
                                role: '',
                                name: 'name',
                                session: Session.session_21_22,
                              ),
                            ),
                        ]
                      : devWingHeads.map(
                          (Member member) {
                            return HeadMemberCard(
                              imageLink: member.imageLink,
                              role: member.role,
                              name: member.name,
                              session: member.session,
                              fb: member.fb,
                              git: member.git,
                              linkedin: member.linkedin,
                              insta: member.insta,
                            );
                          },
                        ).toList(),
                ),
              ),
              PositionHeading(context, "Dev Wing members"),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: members[selectedSession] == null
                      ? [
                          for (int i = 0; i < 5; i++)
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: MemberCard(
                                imageLink: '',
                                role: '',
                                name: 'name',
                                session: Session.session_21_22,
                              ),
                            ),
                        ]
                      : devWingMemberes.map(
                          (Member member) {
                            return MemberCard(
                              imageLink: member.imageLink,
                              role: member.role,
                              name: member.name,
                              session: member.session,
                              fb: member.fb,
                              git: member.git,
                              linkedin: member.linkedin,
                              insta: member.insta,
                            );
                          },
                        ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

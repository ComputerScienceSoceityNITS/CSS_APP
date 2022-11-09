import 'package:cssapp/Models/members/member_api.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/Models/members/member_api.dart';
import 'package:cssapp/Models/members/member.dart';
import 'package:cssapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Developers extends StatefulWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  _DevelopersState createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
  Session selectedSession = Session.session_21_22;
  Map members = {};

  @override
  void initState() {
    super.initState();
    members = Provider.of<MemberApi>(context, listen: false).members;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20, right: 10),
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
        Column(
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
              : (members[selectedSession][Role.devWing] as List<Member>)
                  .map((Member member) {
                  return MemberCard(
                      imageLink: member.imageLink,
                      role: member.role,
                      name: member.name,
                      session: member.session,
                      fb: member.fb,
                      git: member.git,
                      linkedin: member.linkedin,
                      insta: member.insta);
                }).toList(),
        ),
      ],
    );
  }
}

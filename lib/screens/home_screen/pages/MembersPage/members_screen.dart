import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:provider/provider.dart';
import 'package:cssapp/widgets/custom_drop_down.dart';
import 'widgets/members_scroll.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/state_handlers/members/member.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  Session session = Session.session_21_22;

  Map<Session, Map<Role, List<Member>>> members = {};

  @override
  void initState() {
    members = Provider.of<MemberApi>(context, listen: false).members;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberApi>(
      builder: (BuildContext context, MemberApi handler, _) {
        return Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Column(
                  children: [
                    Text("MEMBERS",
                        textAlign: TextAlign.center,
                        style: textLargeSpaced.copyWith(
                            color: Theme.of(context).backgroundColor)),
                    const SizedBox(width: 17, height: 30),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomDropDown(
                          onChanged: (String? updateSession) {
                            setState(() {
                              session = reverseMapSession[updateSession!]!;
                            });
                          },
                          items: Session.values
                              .map((session) => mapSession[session]!)
                              .toList(),
                          dropdownValue: mapSession[session],
                        ),
                      ),
                    ),
                  ],
                ),
                ...(Role.values).map((wing) {
                  return MembersScroll(posts: members[session], wing: wing);
                }).toList(),
              ],
            ),
          ),
        ));
      },
    );
  }
}

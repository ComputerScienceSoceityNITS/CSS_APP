import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:cssapp/utils/storage_handler.dart';
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
          child: Stack(children: [
            !StorageHandler().isDarkTheme()
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.3, 0.7, 0.8, 1],
                        colors: [
                          Color.fromARGB(138, 255, 64, 128),
                          Color.fromARGB(125, 231, 186, 186),
                          Color.fromARGB(170, 94, 144, 231),
                          Color.fromARGB(132, 96, 125, 139),
                          Color.fromARGB(170, 255, 64, 128)
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black,
                  ),
            SingleChildScrollView(
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
          ]),
        ));
      },
    );
  }
}

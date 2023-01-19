import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:lottie/lottie.dart';
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
  Session session = Session.session_22_23;

  Map<Session, Map<Role, List<Member>>> members = {};

  @override
  void initState() {
    Provider.of<MemberApi>(context, listen: false).getAllData().then((value) =>
        members = Provider.of<MemberApi>(context, listen: false).members);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    members = Provider.of<MemberApi>(context, listen: false).members;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberApi>(
      builder: (BuildContext context, MemberApi handler, _) {
        return Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 200,
                  child: Opacity(
                    opacity: 0.7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: LottieBuilder(
                        lottie: Assets.lottieMember.lottie,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 100),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 50,
                              height: 53,
                              decoration: BoxDecoration(
                                  color: Pallet.accentColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Text(
                                "M",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                  fontFamily: 'Segoe Font',
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "EMBER",
                              style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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
                      if (wing != Role.coHead && wing != Role.technical) {
                        return MembersScroll(
                            posts: members[session], wing: wing);
                      }
                      return const SizedBox.shrink();
                    }).toList(),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}

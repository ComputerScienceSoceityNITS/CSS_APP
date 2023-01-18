import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:cssapp/widgets/head_member_card.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
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
  Session selectedSession = Session.session_22_23;
  Map members = {};

  Widget positionHeading(BuildContext ctx, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: textLargeSpaced.copyWith(
          color: Theme.of(context).backgroundColor,
          fontSize: 30,
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
    Member? technicalHead = members[selectedSession]?[Role.head]?.firstWhere(
        (Member m) => m.role.toLowerCase().contains("technical head"));

    List<Member>? devWingHeads = members[selectedSession]?[Role.devWing]?.where(
      (Member m) {
        return m.role.toLowerCase().contains("head");
      },
    ).toList();

    List<Member>? devWingMembers =
        members[selectedSession]?[Role.devWing]?.where(
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
              positionHeading(context, "Technical Head"),
              SizedBox(
                height: 320,
                child: technicalHead == null
                    ? const Shimmer()
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
              positionHeading(context, "Dev Wing Heads"),
              SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: devWingHeads == null
                      ? [for (int i = 0; i < 5; i++) const Shimmer()]
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
              positionHeading(context, "Dev Wing members"),
              SizedBox(
                height: 320,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: devWingMembers == null
                      ? [for (int i = 0; i < 5; i++) const Shimmer()]
                      : devWingMembers.map(
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
              const SizedBox(height: 50)
            ],
          ),
        ),
      ],
    );
  }
}

class Shimmer extends StatelessWidget {
  const Shimmer({Key? key}) : super(key: key);

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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FadeShimmer(
                      height: 7,
                      width: 60,
                      radius: 4,
                      highlightColor: Color(0xffc0c3d3),
                      baseColor: Color(0xff999aa1),
                    ),
                  ),
                  SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FadeShimmer(
                      height: 7,
                      width: 100,
                      radius: 4,
                      highlightColor: Color(0xffc0c3d3),
                      baseColor: Color(0xff999aa1),
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: FadeShimmer(
                      height: 40,
                      width: 140,
                      radius: 4,
                      highlightColor: Color.fromARGB(255, 241, 101, 201),
                      baseColor: Color.fromARGB(255, 215, 101, 139),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FadeShimmer(
                height: 200,
                width: 180,
                radius: 4,
                highlightColor: Color(0xffc0c3d3),
                baseColor: Color(0xff999aa1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

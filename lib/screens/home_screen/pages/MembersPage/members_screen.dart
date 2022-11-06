import 'package:cached_network_image/cached_network_image.dart';
import '../../../../widgets/custom_drop_down.dart';
import 'widgets/members_scroll.dart';
import 'package:cssapp/Models/memberModel.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:cssapp/Models/api_call.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  _MembersPageState createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  String dropdownValue = "21-22";

  static const List<String> wings = [
    "heads",
    "devWing",
    "cpWing",
    "executiveWing",
    "mlWing",
    "designWing",
    "literaryWing",
    "technical"
  ];

  static const List<String> items = ["19-20", "20-21", "21-22"];
  static final Map<String, Map<String, List>> _yearMap = {
    "19-20": Api.members_20,
    "20-21": Api.members_21,
    "21-22": Api.members_22,
  };
  @override
  void initState() {
    super.initState();
    _posts = Api.members_22;
    for (String wing in wings) {
      if (_posts[wing] != null) {
        for (var member in _posts[wing]!) {
          CachedNetworkImage(
            imageUrl: member.pic,
            placeholder: (BuildContext context, String str) {
              return const LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: [Colors.white],
                  strokeWidth: 1,
                  backgroundColor: Colors.black,
                  pathBackgroundColor: Colors.black);
            },
          );
        }
      }
    }
    setState(() {});
  }

  static Map<String, List> _posts = Api.members_22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Column(
                  children: [
                    const Text("MEMBERS",
                        textAlign: TextAlign.center, style: textLargeSpaced),
                    const SizedBox(width: 17, height: 30),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomDropDown(
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              _posts = _yearMap[newValue]!;
                            });
                          },
                          items: items,
                          dropdownValue: dropdownValue,
                        ),
                      ),
                    ),
                  ],
                ),
                ...(wings).map((wing) {
                  return MembersScroll(posts: _posts, wing: wing);
                }).toList(),
              ],
            ),
          ),
        ));
  }
}

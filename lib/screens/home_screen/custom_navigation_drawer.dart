// ignore_for_file: unused_import

import 'package:cssapp/screens/about_screen//about_screen.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:cssapp/screens/auth_screen/auth_screen.dart';
import 'package:cssapp/screens/bitscribe_reader_screen/bitscribe_reader_screen.dart';
import 'package:cssapp/state_handlers/theme/theme_handler.dart';
import 'package:cssapp/utils/network_engine.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../report_bug_pages/report_bugs.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 50);
  final List<String> navigationTexts = [
    'HOME',
    'EVENTS',
    'MEMBERS',
    'GALLERY',
    'DEVELOPERS',
    'BITSCRIBE',
    'ABOUT US',
    'REPORT TO CSS',
    'LOG OUT'
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.event,
    Icons.groups,
    Icons.picture_in_picture,
    Icons.laptop,
    Icons.book_online,
    Icons.info,
    Icons.email,
    Icons.logout
  ];
  final List<int> onPressedMoveToPage = [0, 1, 2, 3, 6];

  CustomNavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return buildMenuItem(
                  context: context,
                  text: navigationTexts[index],
                  icon: icons[index],
                  onPressed: () => selectedItem(context, index));
            },
            separatorBuilder: (BuildContext context, int index) {
              return index == 4
                  ? const Column(
                      children: [
                        SizedBox(height: 24),
                        Divider(color: Colors.grey),
                        SizedBox(height: 24),
                      ],
                    )
                  : const SizedBox(height: 28);
            },
            itemCount: navigationTexts.length,
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required BuildContext context,
    required String text,
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.background,
        size: 23,
      ),
      title: Text(
        text,
        style: textSmallBold.copyWith(color: Theme.of(context).colorScheme.background),
      ),
      hoverColor: hoverColor,
      onTap: onPressed,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(
            initialIndex: 0,
          ),
        ));
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(initialIndex: 1),
        ));
        break;
      case 2:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(initialIndex: 2),
        ));
        break;
      case 3:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(initialIndex: 3),
        ));
        break;
      case 4:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(initialIndex: 4),
        ));
        break;
      case 5:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BitscribeReaderScreen(),
        ));
        break;
      case 6:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AboutUs(),
        ));
        break;
      case 7:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ReportBugs(),
        ));
        break;
      case 8:
        NetworkEngine.signOut().then(
            (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                )));
        break;
    }
  }
}

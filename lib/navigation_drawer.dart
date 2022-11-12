import 'package:cssapp/screens/about_screen//about_screen.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'ReportBugsPage/report_bugs.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 50);
  final List<String> navigationTexts = [
    'HOME',
    'EVENTS',
    'MEMBERS',
    'GALLERY',
    'DEVELOPERS',
    'ABOUT US',
    'REPORT TO CSS',
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.event,
    Icons.groups,
    Icons.picture_in_picture,
    Icons.laptop,
    Icons.info,
    Icons.email,
  ];
  final List<int> onPressedMoveToPage = [0, 1, 2, 3, 6];

  NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<void Function()> pages = [
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AboutUs()),
        );
      },
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReportBugs()),
        );
      }
    ];
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return buildMenuItem(
                context: context,
                text: navigationTexts[index],
                icon: icons[index],
                onPressed: index < 5
                    ? () => selectedItem(context, onPressedMoveToPage[index])
                    : pages[index - 5],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index == 4
                  ? Column(
                      children: const [
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
    final color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
        size: 23,
      ),
      title: Text(
        text,
        style: textSmallBold.copyWith(color: Theme.of(context).primaryColor),
      ),
      hoverColor: hoverColor,
      onTap: onPressed,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(
            initialIndex: 0,
          ),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(initialIndex: 1),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(initialIndex: 2),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(initialIndex: 3),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AboutUs(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ReportBugs(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(initialIndex: 4),
        ));
        break;
    }
  }
}

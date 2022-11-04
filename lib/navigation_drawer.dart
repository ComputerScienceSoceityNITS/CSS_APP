import 'package:cssapp/AboutUsPage/about_us.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'AboutUsPage/about_us.dart';
import 'ReportBugsPage/report_bugs.dart';

class NavigationDrawer extends StatelessWidget {
  // const NavigationDrawer({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 50);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const SizedBox(height: 28),
              buildMenuItem(
                text: 'HOME',
                icon: Icons.home,
                onPressed: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 28),
              buildMenuItem(
                text: 'EVENTS',
                icon: Icons.event,
                onPressed: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 28),
              buildMenuItem(
                text: 'MEMBERS',
                icon: Icons.groups,
                onPressed: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 28),
              buildMenuItem(
                text: 'GALLERY',
                icon: Icons.picture_in_picture,
                onPressed: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 28),
              buildMenuItem(
                text: 'DEVELOPERS',
                icon: Icons.laptop,
                onPressed: () => selectedItem(context, 6),
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.grey),
              const SizedBox(height: 24),
              buildMenuItem(
                  text: 'ABOUT US',
                  icon: Icons.info,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUs()),
                    );
                  }),
              const SizedBox(height: 28),
              buildMenuItem(
                  text: 'REPORT TO CSS',
                  icon: Icons.email,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReportBugs()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({
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
      title: Text(text,
          style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 3.0,
                    color: Colors.black.withOpacity(0.2)),
              ])),
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

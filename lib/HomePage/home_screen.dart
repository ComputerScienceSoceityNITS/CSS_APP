import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:cssapp/EventsPage/events_page.dart';
import 'package:cssapp/GalleryPage/gallery.dart';
import 'package:cssapp/MembersPage/members_screen.dart';
import 'package:cssapp/DevelopersPage/developers_page.dart';
import 'package:flutter/material.dart';
import 'logo.dart';
import '../navigation_drawer.dart';

class HomePage extends StatefulWidget {
  int initialIndex = 0;
  HomePage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = const [
    FirstPage(),
    EventsPage(),
    MembersPage(),
    GalleryPage(),
    DevelopersPage(),
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.initialIndex;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _pageController.jumpToPage(widget.initialIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
          child: Builder(builder: (context) {
            return FloatingActionButton(
              elevation: 12,
              child: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 33,
              ),
              backgroundColor: Colors.white,
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: ConvexAppBar(
          onTap: _onItemTapped,
          initialActiveIndex: _selectedIndex,
          backgroundColor: const Color(0xFFBC4E9C),
          items: const [
            TabItem(icon: Icons.home, title: ''),
            TabItem(icon: Icons.event, title: ''),
            TabItem(icon: Icons.groups, title: ''),
            TabItem(icon: Icons.picture_in_picture, title: ''),
            TabItem(icon: Icons.computer, title: ''),
          ],
        ));
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Logo(),
        ],
      ),
    );
  }
}

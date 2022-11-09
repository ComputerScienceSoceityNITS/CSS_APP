import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'pages/EventsPage/events_page.dart';
import 'pages/GalleryPage/gallery.dart';
import 'pages/MembersPage/members_screen.dart';
import 'pages/DevelopersPage/developers_page.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/navigation_drawer.dart';
import 'pages/HomePage/home_page.dart';
import 'package:cssapp/configs/configs.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;
  const HomeScreen({Key? key, this.initialIndex = 1}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = const [
    HomePage(),
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
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
          backgroundColor: Pallet.accentColor,
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

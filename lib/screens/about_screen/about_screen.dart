import 'package:cssapp/screens/about_screen/widgets/about_details.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  static const double vertPadding = 60;
  static const double horiPadding = 20;
  static const double iconSize = 33;
  static const double elevation = 12;
  static const double leftPadding = 8;
  static const double topPadding = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: leftPadding, top: topPadding),
        child: Builder(builder: (context) {
          return FloatingActionButton(
            elevation: elevation,
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).canvasColor,
              size: iconSize,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(
                    initialIndex: 0,
                  ),
                ),
              );
            },
          );
        }),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: const IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: vertPadding, horizontal: horiPadding),
                    child: AboutDetails(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


import 'package:cssapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cssapp/configs/configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  static const double gap = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 8, top: 25),
        child: Builder(builder: (context) {
          return FloatingActionButton(
            elevation: 12,
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).canvasColor,
              size: 33,
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const CSSBGText(),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text("ABOUT CSS",
                                  textAlign: TextAlign.justify,
                                  style: textLarge.copyWith(
                                      color:
                                          Theme.of(context).backgroundColor)),
                            ),
                            const SizedBox(height: gap),
                            Text(
                                "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. With thousands of members on Facebook, Discord and the like, we strive relentlessly to help them reach the zenith of all-round excellence, and then beyond. ",
                                style: textRegular.copyWith(
                                    height: 1.3,
                                    color: Theme.of(context).backgroundColor)),
                            const SizedBox(height: gap),
                            Text(
                                "All the wings of our society- Executive, CP, Dev, ML, Literary and design, work hand in hand to organize a plethora of exciting and diverse events. While Enigma, Abacus-tec, CSS wars, CSS Hacks and numerous talks and seminars with distinguished personalities set the bar for technical discourse in the college; cultural events like Esperanza, along with various sports tourneys, provide everyone with a sense of brotherhood and much-needed recreation.",
                                style: textRegular.copyWith(
                                    height: 1.3,
                                    color: Theme.of(context).backgroundColor)),
                            const SizedBox(height: gap),
                            Text("Contact",
                                style: textLarge.copyWith(
                                    color: Theme.of(context).backgroundColor)),
                            Text("CSS, NIT Silchar,\nSilchar, Assam\n788010",
                                style: textRegular.copyWith(
                                    height: 1.3,
                                    color: Theme.of(context).backgroundColor)),
                            const SizedBox(height: gap),
                            Text("Socials",
                                textAlign: TextAlign.center,
                                style: textLarge.copyWith(
                                    color: Theme.of(context).backgroundColor)),
                            _Link(
                                child: Assets.cssLogoLight,
                                link: 'https://nitscss.live/',
                                text: "CSS Website"),
                            const _Link(
                                icon: Icons.facebook,
                                link:
                                    'https://www.facebook.com/groups/186753138074295',
                                text: "Facebook"),
                            const _Link(
                                icon: FontAwesomeIcons.youtube,
                                link:
                                    'https://www.youtube.com/channel/UC8tCBXmdKueuFODn_IngQrg',
                                text: "Youtube"),
                            Padding(
                              padding: EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                "©2021 Computer Science Society. All Rights Reserved",
                                textAlign: TextAlign.center,
                                style: textSmall.copyWith(
                                    color: Theme.of(context).backgroundColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  final Widget? child;
  final IconData? icon;
  final String link;
  final String text;
  final double size;
  const _Link(
      {Key? key,
      this.child,
      this.icon,
      required this.link,
      required this.text,
      this.size = 30})
      : assert(child != null || icon != null,
            "child and icon both cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launch(link),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          child != null
              ? SizedBox(
                  width: size,
                  child: child,
                )
              : SocialIcons(icon: icon!, size: size),
          const SizedBox(width: 13),
          Text(text,
              style: textRegular.copyWith(
                  color: Theme.of(context).backgroundColor)),
        ],
      ),
    );
  }
}

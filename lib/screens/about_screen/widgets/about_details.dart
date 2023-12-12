import 'package:cssapp/screens/about_screen/widgets/link.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../configs/configs.dart';

class AboutDetails extends StatefulWidget {
  const AboutDetails({Key? key}) : super(key: key);

  @override
  State<AboutDetails> createState() => _AboutDetailsState();
}

class _AboutDetailsState extends State<AboutDetails> {
  static const double gap = 20;
  static const double height = 1.3;
  static const double topPadding = 30;
  static const double bottomPadding = 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text("ABOUT CSS",
              textAlign: TextAlign.justify,
              style: textLarge.copyWith(
                  color: Theme.of(context).colorScheme.background)),
        ),
        const SizedBox(height: gap),
        Text(
            "The Computer Science Society, run by the CSE department of NIT Silchar, aims to impart academic, technical and socio-cultural awareness to the students of our beloved college. With thousands of members on Facebook, Discord and the like, we strive relentlessly to help them reach the zenith of all-round excellence, and then beyond. ",
            style: textRegular.copyWith(
                height: height,
                color: Theme.of(context).colorScheme.background)),
        const SizedBox(height: gap),
        Text(
            "All the wings of our society- Executive, CP, Dev, ML, Literary and design, work hand in hand to organize a plethora of exciting and diverse events. While Enigma, Abacus-tec, CSS wars, CSS Hacks and numerous talks and seminars with distinguished personalities set the bar for technical discourse in the college; cultural events like Esperanza, along with various sports tourneys, provide everyone with a sense of brotherhood and much-needed recreation.",
            style: textRegular.copyWith(
                height: height,
                color: Theme.of(context).colorScheme.background)),
        const SizedBox(height: gap),
        Text("Contact",
            style: textLarge.copyWith(
                color: Theme.of(context).colorScheme.background)),
        Text("CSS, NIT Silchar,\nSilchar, Assam\n788010",
            style: textRegular.copyWith(
                height: height,
                color: Theme.of(context).colorScheme.background)),
        const SizedBox(height: gap),
        Text("Socials",
            textAlign: TextAlign.center,
            style: textLarge.copyWith(
                color: Theme.of(context).colorScheme.background)),


        const Link(
            icon: Icons.facebook,
            link:
            'https://www.facebook.com/groups/186753138074295',
            text: "Facebook"),
        const Link(
            icon: FontAwesomeIcons.youtube,
            link:
            'https://www.youtube.com/channel/UC8tCBXmdKueuFODn_IngQrg',
            text: "Youtube"),

        const SizedBox(height: gap,),
        Text("WebSite",
            textAlign: TextAlign.center,
            style: textLarge.copyWith(
                color: Theme.of(context).colorScheme.background)),
        Link(
            child: Assets.cssLogoDark,
            link: 'https://nitscss.live/',
            text: "CSS Website"),
        const SizedBox(height: gap,),
        Padding(
          padding: const EdgeInsets.only(top: topPadding, bottom: bottomPadding),
          child: Text(
            "©2021 Computer Science Society. All Rights Reserved",
            textAlign: TextAlign.center,
            style: textSmall.copyWith(
                color: Theme.of(context).colorScheme.background),
          ),
        ),
      ],
    );
  }
}

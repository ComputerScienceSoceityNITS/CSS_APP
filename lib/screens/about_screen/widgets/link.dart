import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../configs/configs.dart';
import '../../../widgets/widgets.dart';
class Link extends StatelessWidget {
  final Widget? child;
  final IconData? icon;
  final String link;
  final String text;
  final double size = 30;
  const Link(
      {Key? key, this.child, this.icon, required this.link, required this.text})
      : assert(child != null || icon != null,
  "child and icon both cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(link)),
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
                  color: Theme.of(context).colorScheme.background)),
        ],
      ),
    );
  }
}
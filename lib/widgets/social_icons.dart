import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final String? link;
  final IconData icon;
  final double size;
  const SocialIcons({Key? key, this.link, required this.icon, this.size = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: size,
        child: Icon(icon, color: Theme.of(context).backgroundColor),
      ),
      onTap: () => launch(link ?? ''),
    );
  }
}

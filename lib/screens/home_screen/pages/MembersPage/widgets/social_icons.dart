import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  final String? link;
  final IconData icon;
  const SocialIcons({Key? key, this.link, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        color: Colors.white,
        size: 15,
      ),
      onTap: () => launch(link ?? ''),
    );
  }
}

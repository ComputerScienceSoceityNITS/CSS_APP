import 'package:cssapp/widgets/buttons/ghost_button.dart';
import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  final String text;
  const ReadMore({Key? key, required this.text}) : super(key: key);

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool showFullText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: showFullText ? null : 5,
          overflow: showFullText ? null : TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16),
        ),
        GhostButton(
          onTap: () {
            setState(() {
              showFullText = !showFullText;
            });
          },
          label: showFullText ? 'Hide' : 'Read more',
        )
      ],
    );
  }
}

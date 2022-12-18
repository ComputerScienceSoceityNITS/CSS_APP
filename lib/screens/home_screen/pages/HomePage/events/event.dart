import 'package:cssapp/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'event_dialog.dart';

class Event extends StatelessWidget {
  final String title;
  final String desc;
  final Image img;
  final String link;
  const Event({
    Key? key,
    required this.title,
    required this.desc,
    required this.img,
    this.link = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => EventDialog(
            desc: desc,
            link: link,
            img: img,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: img.image,
            fit: BoxFit.cover,
            opacity: 0.75,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

/*

 */

import 'package:flutter/material.dart';
import 'event_dialog.dart';

class Event extends StatelessWidget {
  final String title;
  final String desc;
  final Image img;
  final String link;
  const Event(
      {Key? key,
      required this.title,
      required this.desc,
      required this.img,
      this.link = ""})
      : super(key: key);

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
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        width: double.infinity,
        height: 70,
        child: Card(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: img.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

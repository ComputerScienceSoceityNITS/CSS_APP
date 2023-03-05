import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/eventRegistration.dart';
import 'package:flutter/material.dart';

class SingleEventWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 530,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Pallet.accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Event Name',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            '09:55 AM',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'We are delighted to invite your organization, Bosscoder Academy, as a Co-sponsor of this engaging session of our club. Web Blitz is a comprehensive program guiding beginners to dive into the exciting field of Web Development. Through this, one can gain a good grip on HTML, CSS, JavaScript and get hands-on experience by building their own projects at the end of the workshop.',
            style: TextStyle(
              color: Colors.white,
            ),
            maxLines: 8,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventRegistration(),
                ),
              );
            },
            child: Text(
              "View more",
            ),
          ),
        ],
      ),
    );
  }
}

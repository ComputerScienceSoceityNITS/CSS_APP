import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/enigma_text.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/single_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './widgets/abacus_text.dart';

class abacus_page extends StatelessWidget {
  const abacus_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallet.accentColor,
      ),
      body: SafeArea(
        child: SizedBox(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20,
                ),
                decoration:
                    BoxDecoration(color: Pallet.accentColor.withOpacity(0.3)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.people),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Abacus",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'We are delighted to invite your organization, Bosscoder Academy, as a Co-sponsor of this engaging session of our club. Web Blitz is a comprehensive program guiding beginners to dive into the exciting field of Web Development. Through this, one can gain a good grip on HTML, CSS, JavaScript and get hands-on experience by building their own projects at the end of the workshop',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    const Text(
                      'Time Stamp',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 530,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SingleEventWidget(),
                          SingleEventWidget(),
                          SingleEventWidget(),
                          SingleEventWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // const Text(
              //   "WHY?",
              //   style: TextStyle(fontSize: 30),
              // ),
              // Text(
              //   "Lorensisodap doandjanfafafdf",
              //   style: TextStyle(fontSize: 20),
              // ),
              // SizedBox(
              //   height: 28,
              // ),
              // const Text(
              //   "WHAT?",
              //   style: TextStyle(fontSize: 30),
              // ),
              // Text(
              //   "Lorensisodap doandjanfafafdf",
              //   style: TextStyle(fontSize: 20),
              // ),
              // SizedBox(
              //   height: 28,
              // ),
              // const Text(
              //   "ADVANTAGES",
              //   style: TextStyle(fontSize: 30),
              // ),
              // Text(
              //   "Lorensisodap doandjanfafafdf",
              //   style: TextStyle(fontSize: 20),
              // ),
              // SizedBox(height: 60,),
              // const Text(
              //   "MORE ABOUT ENIGMA",
              //   style: TextStyle(fontSize: 30),
              // ),
              // Text(
              //   "Lorensisodap doandjanfafafdf",
              //   style: TextStyle(fontSize: 20),
              // ),
              // SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

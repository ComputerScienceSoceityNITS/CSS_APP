import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/enigma_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './widgets/abacus_text.dart';

class engima_page extends StatelessWidget {
  const engima_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Engima",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 28,
            ),
            const Text(
              "WHY?",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Lorensisodap doandjanfafafdf",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 28,
            ),
            const Text(
              "WHAT?",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Lorensisodap doandjanfafafdf",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 28,
            ),
            const Text(
              "ADVANTAGES",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Lorensisodap doandjanfafafdf",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 60,),
            const Text(
              "MORE ABOUT ENIGMA",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Lorensisodap doandjanfafafdf",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30,),
          ]),
        ),
      ),
    );
  }
}

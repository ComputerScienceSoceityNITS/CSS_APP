import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/widgets/abacus_event_widget.dart';
import 'widgets/read_more.dart';
import 'package:flutter/material.dart';

class AbacusPage extends StatelessWidget {
  const AbacusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pallet.accentColor,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20,
                ),
                decoration:
                    BoxDecoration(color: Pallet.accentColor.withOpacity(0.3)),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(child: Icon(Icons.people)),
                        SizedBox(width: 20),
                        Text(
                          "Abacus",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    ReadMore(
                      text:
                          'We are delighted to invite your organization, Bosscoder Academy, as a Co-sponsor of this engaging session of our club. Web Blitz is a comprehensive program guiding beginners to dive into the exciting field of Web Development. Through this, one can gain a good grip on HTML, CSS, JavaScript and get hands-on experience by building their own projects at the end of the workshop',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Time Stamp',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: const AbacusEventWidget()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

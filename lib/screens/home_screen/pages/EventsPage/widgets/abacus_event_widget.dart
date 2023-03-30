import 'dart:convert';

import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/abacus_event_registration.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/enigmaeventregistration.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/models/eventModel.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import '../../../../../utils/network_engine.dart';

class abacusEventWidget extends StatefulWidget {
  @override
  State<abacusEventWidget> createState() => _abacusEventWidgetState();
}

class _abacusEventWidgetState extends State<abacusEventWidget> {
  List<dynamic> eventdetails = [];

  Future<List<EventModel>> fetcheventdetails() async {
    try {
      var response = await (await NetworkEngine.getDio())
          .get(('https://css-cms.onrender.com/api/admin/abacus/'));

      var jsonResponse = await jsonDecode(response.toString());
      print(jsonResponse);
      int len = jsonResponse["events"].length;
      print(len);
      List<EventModel> events = [];

      for (int i = 0; i < len; i++) {
        CoverPic coverPic = CoverPic(
          public_id: jsonResponse["events"][i]["coverPic"]["public_id"],
          url: jsonResponse["events"][i]["coverPic"]["url"],
        );
        EventModel event = EventModel(
          coverPic: coverPic,
          id: jsonResponse["events"][i]["_id"],
          name: jsonResponse["events"][i]["name"],
          description: jsonResponse["events"][i]["description"],
          startDate: jsonResponse["events"][i]["startDate"],
          endDate: jsonResponse["events"][i]["endDate"],
          startTime: jsonResponse["events"][i]["startTime"],
          eventType: jsonResponse["events"][i]["eventType"],
          groupLink: jsonResponse["events"][i]["groupLink"],
          minTeamSize: jsonResponse["events"][i]["minTeamSize"],
          maxTeamSize: jsonResponse["events"][i]["maxTeamSize"],
        );
        print(event.name);

        events.add(event);
      }

      return events;
      // if ((response.statusCode ?? 400) >= 200 &&
      //     (response.statusCode ?? 400) < 300) {
      // } else {
      //   throw Exception('Failed to fetch events');
      // }
    } on DioError catch (e) {
      throw Exception('Failed to fetch events: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetcheventdetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<EventModel> event = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: event.length,
                itemBuilder: (context, int index) {
                  // print(index);
                  return Container(
                    width: 260,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Pallet.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: event[index].coverPic.url != null
                              ? Image.network(
                                  event[index].coverPic.url,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          event[index].name,
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${event[index].startDate}   -   ${event[index].startDate}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 13),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              event[index].description,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AbacusEventRegistration(
                                  event: event[index],
                                ),
                              ),
                            );
                          },
                          child: const Text("Register Here"),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

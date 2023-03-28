import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/abacuseventregistration.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/enigmaeventregistration.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../../../utils/network_engine.dart';

class enigmaEventWidget extends StatefulWidget {
  @override
  State<enigmaEventWidget> createState() => _enigmaEventWidgetState();
}

class _enigmaEventWidgetState extends State<enigmaEventWidget> {
  List<dynamic> eventdetails = [];

  Future<List> fetcheventdetails() async {
    print('test');
    final dio = await NetworkEngine.getDio();

    try {
      final response =
          await dio.get('https://css-cms.onrender.com/api/admin/enigma');

      if ((response.statusCode ?? 400) >= 200 &&
          (response.statusCode ?? 400) < 300) {
        final responseData = response.data;
        return responseData["enigmas"];
      } else {
        throw Exception('Failed to fetch events');
      }
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
            eventdetails = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventdetails.length,
                itemBuilder: (context, int index) {
                  print(index);
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Pallet.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                              "assets/images/event_thumbnails/Enigma.png",
                              fit: BoxFit.cover),
                        ),
                        Text(
                          "Enigma",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Start : ${eventdetails[index]!["startDate"].toString()}  ${eventdetails[index]!["startTime"].toString()}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                            "Duration :  ${eventdetails[index]!["durationInHrs"]} hours"),
                        Text(
                            "Question-setters: ${eventdetails[index]["questionSetters"]}"),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Register Here",
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

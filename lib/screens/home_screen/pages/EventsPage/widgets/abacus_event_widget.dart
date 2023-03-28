import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/abacuseventregistration.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/enigmaeventregistration.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../../../utils/network_engine.dart';

class abacusEventWidget extends StatefulWidget {
  @override
  State<abacusEventWidget> createState() => _abacusEventWidgetState();
}

class _abacusEventWidgetState extends State<abacusEventWidget> {
  List<dynamic> eventdetails = [];

  Future<List> fetcheventdetails() async {
    print('test');
    final dio = await NetworkEngine.getDio();

    try {
      final response =
          await dio.get('https://css-cms.onrender.com/api/admin/abacus/');

      if ((response.statusCode ?? 400) >= 200 &&
          (response.statusCode ?? 400) < 300) {
        final responseData = response.data;
        return responseData["events"];
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
                    width: 220,
                    height: 530,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Pallet.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.47,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: eventdetails[index]?["coverPic"]
                                              ?["url"] !=
                                          null
                                      ? Image.network(
                                          eventdetails[index]["coverPic"]
                                              ["url"],
                                          fit: BoxFit.cover,
                                        )
                                      : SizedBox(),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  eventdetails[index]["name"],
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${eventdetails[index]["startDate"]}     ${eventdetails[index]["startTime"]}',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Text(
                                  eventdetails[index]["description"],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  maxLines: 8,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AbacusEventRegistration(),
                              ),
                            );
                          },
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

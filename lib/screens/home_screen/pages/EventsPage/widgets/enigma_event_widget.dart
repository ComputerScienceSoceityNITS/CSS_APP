import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/state_handlers/user/user_handler.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/network_engine.dart';

class EnigmaEvent extends StatefulWidget {
  const EnigmaEvent({Key? key}) : super(key: key);

  @override
  State<EnigmaEvent> createState() => _EnigmaEventState();
}

class _EnigmaEventState extends State<EnigmaEvent> {
  List<dynamic> eventdetails = [];
  bool isLoading = false;

  Future<List> fetcheventdetails() async {
    try {
      final response =
          await (await NetworkEngine.getDio()).get('/api/admin/enigma');

      if ((response.statusCode ?? 400) >= 200 &&
          (response.statusCode ?? 400) < 300) {
        final responseData = response.data;
        return responseData["enigmas"] ?? [];
      } else {
        throw Exception('Failed to fetch events');
      }
    } on DioError catch (e) {
      throw Exception('Failed to fetch events: ${e.message}');
    }
  }

  // Function to categorize events
  Map<String, List<dynamic>> categorizeEvents(List<dynamic> events) {
    final upcomingEvents = <dynamic>[];
    final liveEvents = <dynamic>[];
    final pastEvents = <dynamic>[];

    final now = DateTime.now();

    for (final event in events) {
      final startDate = DateTime.parse(event?["startDate"] ??
          '');
      final durationInHrs = event?["durationInHrs"] as int?;

      if (durationInHrs != null) {
        final endDate = startDate.add(Duration(hours: durationInHrs));

        if (endDate.isBefore(now)) {
          pastEvents.add(event);
        } else if (startDate.isAfter(now)) {
          upcomingEvents.add(event);
        } else {
          liveEvents.add(event);
        }
      }
    }

    return {
      'upcoming': upcomingEvents,
      'live': liveEvents,
      'past': pastEvents,
    };
  }

  Widget _buildSection(String title, List<dynamic>? events) {
    if (events == null || events.isEmpty) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventdetails.length,
                itemBuilder: (context, int index) {
                  if (eventdetails[index] == null || eventdetails.isEmpty) {
                    return SizedBox();
                  }
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Pallet.accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20),
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
                        const Text(
                          "Enigma",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Start : ${eventdetails[index]!["startDate"].toString()}  ${eventdetails[index]!["startTime"].toString()}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        Text(
                            "Duration :  ${eventdetails[index]!["durationInHrs"] ?? 0} hours"),
                        Text(
                            "Question-setters: ${eventdetails[index]["questionSetters"]}"),
                        ElevatedButton(
                          onLongPress: () async {
                            if (Provider.of<UserHandler>(context, listen: false)
                                .user!
                                .registeredEnigmas
                                .contains(
                                    eventdetails[index]!['_id'].toString())) {
                              await Clipboard.setData(ClipboardData(
                                  text: eventdetails[index]!["cfContestLink"]));
                              Fluttertoast.showToast(
                                  msg: "Contest link copied to clipboard");
                            }
                          },
                          onPressed: () async {
                            if (!Provider.of<UserHandler>(context,
                                    listen: false)
                                .user!
                                .registeredEnigmas
                                .contains(
                                    eventdetails[index]!['_id'].toString())) {
                              setState(() {
                                isLoading = true;
                              });
                              Response res = await Provider.of<UserHandler>(
                                      context,
                                      listen: false)
                                  .registerEnigma(eventdetails[index]['_id']);

                              if ((res.statusCode ?? 400) >= 200 &&
                                  (res.statusCode ?? 400) < 300) {
                                Fluttertoast.showToast(
                                    msg: res.data['error'] ?? 'Unknown Error');
                              }
                            } else {
                              launchUrl(
                                  Uri.parse(
                                      eventdetails[index]!["cfContestLink"]),
                                  mode: LaunchMode.externalApplication);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Text(
                            Provider.of<UserHandler>(context)
                                    .user!
                                    .registeredEnigmas
                                    .contains(
                                        eventdetails[index]!['_id'].toString())
                                ? "Go to Contest"
                                : "Register Here",
                          ),
                        ),
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetcheventdetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && !isLoading) {
            eventdetails = snapshot.data;

            if (eventdetails.isEmpty) {
              return Center(
                  child: Text(
                      'No events available')); // Handle null or empty eventdetails
            }

            eventdetails.sort(
              (a, b) => a["startDate"].compareTo(b["startDate"]),
            );
            final categorizedEvents = categorizeEvents(eventdetails);
            return DefaultTabController(
              length: 3, // Number of tabs (Live, Upcoming, Past)
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  backgroundColor: Pallet.darkPrimaryColor,
                  title: const Text('Enigma Events'),
                  bottom: TabBar(
                    labelColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Pallet.accentColor,
                    ),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: Center(child: Text('Live')),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: Center(child: Text('Upcoming')),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: Center(child: Text('Past')),
                        ),
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    _buildSection('Live', categorizedEvents['live']!),
                    _buildSection('Upcoming', categorizedEvents['upcoming']!),
                    _buildSection('Past', categorizedEvents['past']!),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

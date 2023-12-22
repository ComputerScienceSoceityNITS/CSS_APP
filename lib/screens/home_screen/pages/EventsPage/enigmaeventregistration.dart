import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/utils/network_engine.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EnigmaEventRegistration extends StatefulWidget {
  const EnigmaEventRegistration({Key? key}) : super(key: key);

  @override
  State<EnigmaEventRegistration> createState() =>
      _EnigmaEventRegistrationState();
}

class _EnigmaEventRegistrationState extends State<EnigmaEventRegistration> {
  late int index = 0;

  List<dynamic> eventdetails = [];
  Future<List> getdetail() async {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.people),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Enigma",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 28,
                              ),
                              // Text(
                              //   'Start Date : ${eventdetails[index]!["startTime"]}  \nEnd Date : ${eventdetails[index]["startTime"]} ',
                              //   style: TextStyle(
                              //     fontSize: 16,
                              //     // color: Colors.black,
                              //   ),
                              // ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Time : 9:15 AM',
                                style: TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Organiser : Priyabrat',
                                style: TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Min : 1  Max : 5',
                                style: TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'Register Yourself',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text("Register in CodeForces")),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

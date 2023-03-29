import 'dart:convert';

import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:cssapp/models/memberModel.dart';
import 'package:cssapp/provider/abacusRegistrationProvider.dart';
import 'package:cssapp/screens/home_screen/pages/EventsPage/models/eventModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AbacusEventRegistration extends StatelessWidget {
  final EventModel event;
  AbacusEventRegistration({required this.event});
  @override
  Widget build(BuildContext context) {
    int min = event.minTeamSize;
    int max = event.maxTeamSize;
    List<TextEditingController> nameControllers = [];
    List<TextEditingController> idControllers = [];
    TextEditingController teamNameController = TextEditingController();
    TextEditingController teamLeaderNameController = TextEditingController();
    TextEditingController teamLeaderScholarIdController =
        TextEditingController();
    for (int i = 0; i < max - 1; i++) {
      TextEditingController nameController = TextEditingController();
      TextEditingController idController = TextEditingController();
      nameControllers.add(nameController);
      idControllers.add(idController);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Abacus ',
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // const CircleAvatar(
                        //   child: Icon(Icons.people),
                        // ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        Text(
                          "${event.name}",
                          style: const TextStyle(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 28,
                              ),
                              Text(
                                'Start Date : ${event.startDate}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'End Date : ${event.endDate}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Time : ${event.startTime}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Group Link : ${event.groupLink}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  // color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Min : ${event.minTeamSize}  Max : ${event.maxTeamSize}',
                                style: const TextStyle(
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
                            child: Image.network(event.coverPic.url),
                          ),
                        ]),
                    // Text(
                    //   'We are delighted to invite your organization, Bosscoder Academy, as a Co-sponsor of this engaging session of our club. Web Blitz is a comprehensive program guiding beginners to dive into the exciting field of Web Development. Through this, one can gain a good grip on HTML, CSS, JavaScript and get hands-on experience by building their own projects at the end of the workshop',
                    //   maxLines: 5,
                    //   overflow: TextOverflow.ellipsis,
                    //   textAlign: TextAlign.justify,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.black,
                    //   ),
                    // ),
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
              SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Container(
                      height: 440,
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          TextFormField(
                            controller: teamNameController,
                            decoration: const InputDecoration(
                              labelText: 'Team Name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: teamLeaderNameController,
                            decoration: const InputDecoration(
                              labelText: 'Team Leader Name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: teamLeaderScholarIdController,
                            decoration: const InputDecoration(
                              labelText: 'Team Leader Scholar Id',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          for (int i = 0; i < max - 1; i++)
                            Column(
                              children: [
                                TextFormField(
                                  controller: nameControllers[i],
                                  decoration: InputDecoration(
                                    labelText: (i >= min - 1)
                                        ? 'Member ${i + 1} Name (Optional)'
                                        : 'Member ${i + 1} Name',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: idControllers[i],
                                  decoration: InputDecoration(
                                    labelText: (i >= min - 1)
                                        ? 'Member ${i + 1} Scholar Id (Optional)'
                                        : 'Member ${i + 1} Scholar Id',
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Pallet.accentColor,
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        List<MemberModel> members = [];

                        for (int i = 0; i < max - 1; i++) {
                          if (nameControllers[i].text.isNotEmpty) {
                            MemberModel member = MemberModel(
                              name: nameControllers[i].text,
                              scholarId: idControllers[i].text,
                            );
                            members.add(member);
                          }
                          print(event.id);
                        }
                        Response res =
                            await Provider.of<AbacusRegistrationProvider>(
                                    context,
                                    listen: false)
                                .register(
                                    eventId: event.id,
                                    teamName: teamNameController.text,
                                    teamLeaderScholarID:
                                        teamLeaderScholarIdController.text,
                                    members: members);
                        var jsonResponse = await jsonDecode(res.toString());
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                RegistrationPopUp(
                                  isSuccess: (res.statusCode == 201),
                                  msg: jsonResponse["message"],
                                ));
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
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

class RegistrationPopUp extends StatelessWidget {
  final bool isSuccess;
  final String msg;
  RegistrationPopUp({
    required this.isSuccess,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 200,
        height: 200,
        // color: Theme.of(context).,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  (isSuccess) ? 'assets/lottie/registration_success.json' : 'assets/lottie/registration_failed.json',
                  height: 70,
                  width: 70,
                ),
                SizedBox(height: 30),
                Text(
                  msg,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

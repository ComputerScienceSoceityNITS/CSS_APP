import 'package:cssapp/configs/configurations/pallet.dart';
import 'package:flutter/material.dart';

class AbacusEventRegistration extends StatefulWidget {
  @override
  State<AbacusEventRegistration> createState() =>
      _AbacusEventRegistrationState();
}

class _AbacusEventRegistrationState extends State<AbacusEventRegistration> {
  int activate_register = 0;
  int activate_radiobutton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Abacus ',
          ),
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
                        CircleAvatar(
                          child: Icon(Icons.people),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Event Name",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              'Start Date : 24/03/2023  \nEnd Date : 24/03/2023 ',
                              style: TextStyle(
                                fontSize: 16,
                                // color: Colors.black,
                              ),
                            ),
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
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Team Name',
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Submit'),
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

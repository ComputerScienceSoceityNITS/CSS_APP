import './main.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/HomePage/home_screen.dart';
import './MembersPage/members_screen.dart';
import 'Models/api_call.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Api.getData1();
    Api.getData2();
    Api.getData3();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  initialIndex: 0,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
          ),
        )));
  }
}

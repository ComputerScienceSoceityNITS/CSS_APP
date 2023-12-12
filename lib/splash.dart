import 'package:cssapp/screens/auth_screen/auth_screen.dart';
import 'package:cssapp/state_handlers/members/member_api.dart';
import 'package:cssapp/state_handlers/user/user_handler.dart';
import 'package:cssapp/utils/network_engine.dart';
import 'package:cssapp/utils/storage_handler.dart';
import 'package:flutter/material.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'configs/configs.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      Provider.of<MemberApi>(context, listen: false).isOnline = true;
      if (await NetworkEngine.doesCookieDirExists()) {
        await Provider.of<UserHandler>(context, listen: false).fetchUser();
      }
    } else {
      Provider.of<MemberApi>(context, listen: false).isOnline = false;
      Fluttertoast.showToast(msg: "Couldn't connect to the internet");
    }
    Widget page = const AuthScreen();
    if (Provider.of<UserHandler>(context, listen: false).user != null) {
      page = const HomeScreen(initialIndex: 0);
    }
    Future.delayed(const Duration(milliseconds: 1500)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Image(
              image: StorageHandler().isDarkTheme()
                  ? Assets.cssLogoLight.image
                  : Assets.cssLogoDark.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

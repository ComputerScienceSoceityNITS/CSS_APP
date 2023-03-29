import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/sign_in_page.dart';
import 'pages/sign_up_page.dart';
import 'package:cssapp/utils/storage_handler.dart';
import 'package:cssapp/state_handlers/theme/theme_handler.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  double currentPage = 0;
  late final PageController pageController;
  late final List<Widget> items;
  @override
  void initState() {
    pageController = PageController()
      ..addListener(() {
        currentPage = pageController.page ?? 0;
      });
    items = [
      SignInPage(
        onTapSignUp: () {
          pageController.animateToPage(1,
              duration: kThemeAnimationDuration, curve: Curves.easeInOut);
        },
      ),
      SignUpPage(
        onTapSignIn: () {
          pageController.animateToPage(0,
              duration: kThemeAnimationDuration, curve: Curves.easeInOut);
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: FloatingActionButton(
          elevation: 100,
          child: Icon(
            StorageHandler().isDarkTheme()
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            color: StorageHandler().isDarkTheme() ? Colors.black : Colors.white,
            size: 33,
          ),
          backgroundColor:
              StorageHandler().isDarkTheme() ? Colors.white : Colors.pink,
          onPressed: () {
            Provider.of<ThemeHandler>(context, listen: false).toggleTheme();
          },
          foregroundColor: Theme.of(context).backgroundColor,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Theme.of(context).brightness == Brightness.dark
                  ? Assets.cssLogoLight
                  : Assets.cssLogoDark,
            ),
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Transform(
                      transform: Matrix4.identity()..translate(currentPage),
                      child: items[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

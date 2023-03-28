import 'dart:convert';

import 'package:cssapp/state_handlers/user/user_handler.dart';
import 'package:cssapp/state_handlers/user/user_model.dart';
import 'package:cssapp/widgets/buttons/active_button.dart';
import 'package:cssapp/widgets/buttons/ghost_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cssapp/utils/network_engine.dart';
import 'package:provider/provider.dart';
import 'custom_text_field.dart';
import 'package:cssapp/screens/home_screen/home_screen.dart';

class SignInPage extends StatefulWidget {
  final void Function() onTapSignUp;
  const SignInPage({Key? key, required this.onTapSignUp}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          )
        : SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      label: 'Email',
                      controller: emailController,
                      validator: (String? str) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(str ?? '')) {
                          return "Invalid email";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      label: 'Password',
                      controller: passwordController,
                      isToggleEnabled: true,
                      obscureText: true,
                      validator: (String? str) {
                        if (str == null || str.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ActiveButton(
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                Response res = await Provider.of<UserHandler>(
                                        context,
                                        listen: false)
                                    .login(
                                        password: passwordController.text,
                                        email: emailController.text);
                                setState(() {
                                  isLoading = false;
                                });
                                if (res.statusCode == null ||
                                    res.statusCode! < 200 ||
                                    res.statusCode! >= 300) {
                                  Fluttertoast.showToast(
                                      msg: res.data['message']?["error"] ??
                                          "Unknown Error");
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return const HomeScreen(
                                      initialIndex: 0,
                                    );
                                  }));
                                }
                              } on DioError catch (e) {
                                String err;
                                if (e.response?.data['message'] != null) {
                                  err = e.response?.data['message'];
                                } else {
                                  if (e.response?.data['error'] != null) {
                                    err = e.response?.data['error'] ??
                                        "Unknown Error";
                                  } else {
                                    err = e.message ?? 'Unknown Error';
                                  }
                                }

                                Fluttertoast.showToast(msg: err);
                              }
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          label: 'Sign In',
                        ),
                        GhostButton(
                          onTap: widget.onTapSignUp,
                          label: 'Sign Up',
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
  }
}

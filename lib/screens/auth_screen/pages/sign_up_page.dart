import 'dart:convert';

import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'package:cssapp/state_handlers/user/user_handler.dart';
import 'package:cssapp/widgets/buttons/ghost_button.dart';
import 'package:cssapp/widgets/buttons/active_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTapSignIn;
  const SignUpPage({Key? key, required this.onTapSignIn}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController(),
      scholarIDController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPassController = TextEditingController(),
      codeforcesHandlerController = TextEditingController(),
      githubHandleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emptyValidator(String? str) {
    if (str == null || str.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

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
                  children: [
                    CustomTextField(
                      label: 'Name',
                      controller: nameController,
                      validator: emptyValidator,
                    ),
                    CustomTextField(
                      label: 'Scholar ID',
                      controller: scholarIDController,
                      validator: emptyValidator,
                    ),
                    CustomTextField(
                      label: 'Email( Institute )',
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
                      isToggleEnabled: true,
                      obscureText: true,
                      validator: emptyValidator,
                      controller: passwordController,
                    ),
                    CustomTextField(
                      label: 'Confirm Password',
                      obscureText: true,
                      isToggleEnabled: true,
                      controller: confirmPassController,
                      validator: (String? str) {
                        if (str != passwordController.text) {
                          return "must match password";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      label:
                          'Codeforces Handle (This field is required to join Enigma)',
                      controller: codeforcesHandlerController,
                    ),
                    CustomTextField(
                      label: 'Github Handle',
                      controller: githubHandleController,
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
                                    .createUser(
                                        name: nameController.text,
                                        password: passwordController.text,
                                        email: emailController.text,
                                        scholarID: scholarIDController.text,
                                        codeforcesHandle:
                                            codeforcesHandlerController.text,
                                        githubHandle:
                                            githubHandleController.text);

                                setState(() {
                                  isLoading = false;
                                });
                                if (res.statusCode == null ||
                                    res.statusCode! < 200 ||
                                    res.statusCode! >= 300) {
                                  Fluttertoast.showToast(
                                      msg: res.data['message']);
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
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
                          label: 'Sign Up',
                        ),
                        GhostButton(
                          onTap: widget.onTapSignIn,
                          label: 'Sign In',
                        ),
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

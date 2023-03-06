import 'dart:convert';

import 'package:cssapp/screens/home_screen/home_screen.dart';
import 'package:cssapp/utils/network_engine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                      label: 'Codeforces Handle',
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
                        ElevatedButton(
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                Map data = {
                                  'name': nameController.text,
                                  'password': passwordController.text,
                                  'email': emailController.text,
                                  'scholarID': scholarIDController.text,
                                };
                                if (confirmPassController.text.isNotEmpty) {
                                  data['codeforces'] =
                                      codeforcesHandlerController.text;
                                }
                                if (githubHandleController.text.isNotEmpty) {
                                  data['githubHandle'] =
                                      githubHandleController.text;
                                }
                                Response res =
                                    await (await NetworkEngine.getDio()).post(
                                        NetworkEngine.registerUser,
                                        data: json.encode(data));
                                setState(() {
                                  isLoading = false;
                                });
                                if (res.statusCode == null ||
                                    res.statusCode! < 200 ||
                                    res.statusCode! >= 300) {
                                  Fluttertoast.showToast(
                                      msg: res.data['message']);
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
                                  if (e.response != null) {
                                    err = e.response.toString();
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
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black87),
                          child: const Text('Sign Up'),
                        ),
                        TextButton(
                            onPressed: widget.onTapSignIn,
                            style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black87),
                            child: const Text('Sign in')),
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

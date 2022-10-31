import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

class ReportBugs extends StatefulWidget {
  const ReportBugs({Key? key}) : super(key: key);

  @override
  State<ReportBugs> createState() => _ReportBugsState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final subjectController = TextEditingController();
final messageController = TextEditingController();

Future<void> sendEmail() async {
  try {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    String name = nameController.text;
    String email = emailController.text.trim();
    String subject = subjectController.text;
    String message = messageController.text;
    const serviceId = "service_rvef4wd";
    const templateId = "template_ifh1o4d";
    const userId = "CVD052yKVtaMl2d4n";
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({
          "service_id": serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": name,
            "email": email,
            "subject": subject,
            "message": message
          }
        }));
    print(response.statusCode);
  } catch (e) {
    print(e);
  }
}

class _ReportBugsState extends State<ReportBugs> {
  bool isLoading = false;
  String? errorText;

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        elevation: 6.0,
        content: const Text("Thanks For Your Feedback!",
            style: TextStyle(color: Colors.white)),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.blue.withOpacity(0.4),
      ),
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(8, 25, 0, 0),
          child: Builder(builder: (context) {
            return FloatingActionButton(
                elevation: 12,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 33,
                ),
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                });
          }),
        ),
        backgroundColor: Colors.black,
        body: SizedBox(
          height: (MediaQuery.of(context).orientation == Orientation.landscape
              ? MediaQuery.of(context).size.width -
                  MediaQuery.of(context).padding.top
              : MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top),
          child: Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 100, 0, 0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Computer',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.1),
                                    fontSize: 70,
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Science',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.1),
                                    fontSize: 70,
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Society',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.1),
                                    fontSize: 70,
                                    fontFamily: 'Anton',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                          child: Column(
                        children: [
                          SizedBox(height: 100,),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: nameController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: Colors.white),
                                  child: Icon(Icons.account_circle)),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Name(optional)',
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: emailController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: Colors.white),
                                  child: Icon(Icons.email)),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Email Address',
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: subjectController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: Colors.white),
                                  child: Icon(Icons.subject)),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Subject',
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: messageController,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              border: OutlineInputBorder(),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: Colors.white),
                                  child: Icon(Icons.message)),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Your message',
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (emailController.text.isEmpty ||
                                  subjectController.text.isEmpty ||
                                  messageController.text.isEmpty) {
                                setState(() {
                                  errorText = "Please fill all fields!";
                                });
                              } else {
                                await sendEmail();
                                setState(() {
                                  errorText = null;
                                });
                                setState(() {
                                  isLoading = true;
                                });
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    isLoading = false;
                                    nameController.clear();
                                    emailController.clear();
                                    subjectController.clear();
                                    messageController.clear();
                                    _showToast(ctx);
                                  });
                                });
                              }
                            },
                            child: isLoading
                                ? const SizedBox(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                    height: 15,
                                    width: 15,
                                  )
                                : const Text("Send Message"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: <Widget>[
                              errorText != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.error,
                                            color: Colors.red,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            errorText!,
                                            style: const TextStyle(color: Colors.red),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const SizedBox(
                            width: 300,
                            child: Text(
                              "Diclaimer: Reporting to CSS must be formal. Here, you can register ideas and suggestions for the website and everything CSS. Please avoid unnecessary messages and spams. Strict actions will be taken against those violating these rules.",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 6),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

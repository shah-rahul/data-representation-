import 'package:flutter/material.dart';
import 'package:nudron/apis/authApis.dart';
import 'package:nudron/screens/authScreens/numberVfPage.dart';

import '../../widgets/sideBar/nudron_textform_field.dart';

class EmailVerificationPage extends StatefulWidget {
  final String email;
  const EmailVerificationPage(
      {Key? key,  required this.email})
      : super(key: key);
  static const routeName = '/emailVerification';

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

AuthApis api = AuthApis();
TextEditingController codeController = TextEditingController();

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  verifyMail() async {
    var status = await api.emailVerification(
        widget.email, codeController.text, context);
    if (status == 200) {
      Navigator.of(context).pushNamed(NumberVerificationPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
          ),
          Center(
            child: Stack(
              children: [
                Image.asset(
                  "login.jpeg",
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text("Verify Email Address",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                              "Please enter your the verification code sent to your email address",
                              style:
                                  Theme.of(context).primaryTextTheme.headline5),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
                              isEnabled: true,
                              controller: codeController,
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 300),
                            height: MediaQuery.of(context).size.height * 0.2),
                        InkWell(
                          onTap: () {
                            print("Sign up click");
                          },
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.07,
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              decoration: BoxDecoration(
                                  color: Colors.teal[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

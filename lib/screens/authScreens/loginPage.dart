import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nudron/apis/authApis.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<Login> createState() => _SignupState();
}

AuthApis api = AuthApis();
TextEditingController emailController = TextEditingController();
TextEditingController passWordController = TextEditingController();

class _SignupState extends State<Login> {
  void saveData() async {
    if (await api.login(emailController.text, passWordController.text, context) == 200) {
      Navigator.of(context).pushNamed('/homePage');
    } else {
      print('error');
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Enter Email",
                            style:
                                Theme.of(context).primaryTextTheme.headline3),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: NudronTextFieldBuilder(
                            isEnabled: true,
                            controller: emailController,
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Enter Password",
                            style:
                                Theme.of(context).primaryTextTheme.headline3),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: NudronTextFieldBuilder(
                            controller: passWordController,
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 300),
                            height: MediaQuery.of(context).size.height * 0.2),
                        InkWell(
                          onTap: () {
                            print("Sign up click");
                          },
                          child: GestureDetector(
                            onTap: () {
                              saveData();
                            },
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

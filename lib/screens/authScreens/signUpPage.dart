import 'package:flutter/material.dart';
import 'package:nudron/apis/authApis.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const routeName = "/signUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController atCode = TextEditingController();
  AuthApis api = AuthApis();
  @override
  Widget build(BuildContext context) {
    signUp() {
      api.signUp(nameController.text, emailController.text,
          passWordController.text, phoneController.text, atCode.text);
    }

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
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: SingleChildScrollView(
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
                          Text("Name",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
                              isEnabled: true,
                              controller: nameController,
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Email",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
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
                          Text("Password",
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
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Confirm Password",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
                              controller: confirmPassWordController,
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Phone Number",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
                              controller: phoneController,
                              icon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Activation Code",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
                              controller: atCode,
                              icon: Icon(
                                Icons.code,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              height:
                                  MediaQuery.of(context).size.height * 0.07),
                          InkWell(
                            onTap: () {
                              print("Sign up click");
                            },
                            child: GestureDetector(
                              onTap: () {
                                signUp();
                              }
                              ,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.teal[400],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

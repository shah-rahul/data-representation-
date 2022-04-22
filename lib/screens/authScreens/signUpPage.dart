import 'package:flutter/material.dart';
import 'package:nudron/apis/authApis.dart';
import 'package:nudron/screens/authScreens/emailVfPage.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const routeName = "/signUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final formGlobalkey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController atCode = TextEditingController();
  AuthApis api = AuthApis();
  @override
  Widget build(BuildContext context) {
    signUp() async {
      var status = await api.signUp(nameController.text, emailController.text,
          passWordController.text, phoneController.text, atCode.text, context);

      if (status == 200) {
        Navigator.of(context)
            .pushNamed(EmailVerificationPage.routeName, arguments: {
          emailController.text,
        });
      }
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
                      child: Form(
                        key: formGlobalkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Create Account",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline3),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Name",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
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
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Email",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: NudronTextFieldBuilder(
                                  controller: emailController,
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Confirm Email",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        controller: confirmEmailController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.black,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  22, 15, 17, 15),
                                          labelStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          isDense: true,
                                          enabled: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'All fields are required';
                                          } else if (value !=
                                              emailController.text) {
                                            return 'Email does not match';
                                          } else {
                                            return (null);
                                          }
                                        }),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Password",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: NudronTextFieldBuilder(
                                  isObscure: true,
                                  controller: passWordController,
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Confirm Password",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        controller: confirmPassWordController,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: Colors.black,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  22, 15, 17, 15),
                                          labelStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyText1,
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          isDense: true,
                                          enabled: true,
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'All fields are required';
                                          } else if (value !=
                                              passWordController.text) {
                                            return 'Email does not match';
                                          } else {
                                            return (null);
                                          }
                                        }),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Phone Number",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: NudronTextFieldBuilder(
                                  controller: phoneController,
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, bottom: 10),
                              child: Text("Activation Code",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: NudronTextFieldBuilder(
                                  controller: atCode,
                                  icon: Icon(
                                    Icons.code,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                            ),
                            InkWell(
                              onTap: () {
                                print("Sign up click");
                              },
                              child: GestureDetector(
                                onTap: () {
                                  if (emailController.text ==
                                      confirmEmailController) {}

                                  if (formGlobalkey.currentState!.validate()) {
                                    signUp();
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  margin: const EdgeInsets.only(
                                      bottom: 10, right: 20, left: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.teal[400],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: Text(
                                  "Back to login",
                                  style: TextStyle(color: Colors.blue[700]),
                                ),
                              ),
                            )
                          ],
                        ),
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

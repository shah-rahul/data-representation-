import 'package:flutter/material.dart';
import 'package:nudron/apis/authApis.dart';
import 'package:nudron/screens/authScreens/loginPage.dart';
import 'package:nudron/screens/home_page.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_field.dart';

class NumberVerificationPage extends StatefulWidget {
  const NumberVerificationPage({Key? key}) : super(key: key);
  static const routeName = '/numberVerification';

  @override
  State<NumberVerificationPage> createState() => _NumberVerificationPageState();
}

TextEditingController code = TextEditingController();
AuthApis api = AuthApis();

class _NumberVerificationPageState extends State<NumberVerificationPage> {
  veryifyPhone() async {
    int res = await api.phoneVerificationConfirmation(context, code.text);
    res == 200 ? Navigator.of(context).pushNamed(HomePage.routeName) : print(res);
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
                          child: Text("Verify Phone Number",
                              style:
                                  Theme.of(context).primaryTextTheme.headline3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(
                              "Please enter your the verification code sent to your phone number",
                              style:
                                  Theme.of(context).primaryTextTheme.headline5),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text("Verification Code",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline4),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Text("Resend OTP",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .overline),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: NudronTextFieldBuilder(
                              isEnabled: true,
                              controller: code,
                              icon: Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 550),
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
                                  "Confirm",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //wrong phone number
                                Text("Wrong Phone Number?",
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline5),
                                Text(
                                  "  Change Phone",
                                  style: TextStyle(color: Colors.blue[700]),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                         
                          onTap: () {
                            Navigator.of(context).pushNamed(Login.routeName);
                          },
                          child: Center(
                            child: Text(
                              "Back to Login",
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                          ),
                        )
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

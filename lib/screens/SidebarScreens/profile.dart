import 'package:flutter/material.dart';
import 'package:nudron/widgets/sideBar/category_builder.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_field.dart';
import 'package:nudron/widgets/sideBar/nudron_textform_withouticon.dart';
import 'package:provider/provider.dart';

import '../../providers/userDataProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

var userNameField = TextEditingController();
var emailField = TextEditingController();
var phoneField = TextEditingController();
var currPass = TextEditingController();
var newPass = TextEditingController();
var confirmPass = TextEditingController();

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void setData() {
    userNameField.text = Provider.of<UserDataProvider>(context).user.name;
    emailField.text = Provider.of<UserDataProvider>(context).user.email;
    phoneField.text = Provider.of<UserDataProvider>(context).user.phone;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CategoryBuilder(title: "User Profile"),
          NudronTextFieldBuilder(
            controller: userNameField,
            icon: Icon(Icons.person),
          ),
          NudronTextFieldBuilder(
            controller: emailField,
            icon: Icon(Icons.mail),
            isEnabled: false,
          ),
          NudronTextFieldBuilder(
            controller: phoneField,
            icon: Icon(Icons.phone),
          ),
          CategoryBuilder(title: "Change Password"),
          NudronTextFieldBuilderWithoutIcon(
            controller: currPass,
            text: "Current Password",
          ),
          NudronTextFieldBuilderWithoutIcon(
            controller: newPass,
            text: "New Password",
          ),
          NudronTextFieldBuilderWithoutIcon(
            controller: confirmPass,
            text: "Confirm Password",
          ),
          CategoryBuilder(title: "Global Logout"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Logout of all devices",
                style: Theme.of(context).primaryTextTheme.headline4,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(2225, 0, 0, 1)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {},
                    child: const Text("CONFIRM")),
              )
            ],
          )
        ],
      ),
    );
  }
}

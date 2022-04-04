import 'package:flutter/material.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/widgets/sideBar/category_builder.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserDataProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            const CategoryBuilder(title: "Acoount Information"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Account ID",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.accountID.toString(),
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Account Label",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.accountLabel,
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            const CategoryBuilder(title: "Provider Information"),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Provider Name",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.providerName,
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Valid Till",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.validTill.toString(),
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Address",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.address,
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            //phone
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Phone",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.providerPhone,
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            //email
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Email",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.providerEmail,
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            //support contact
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Support Contact",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.supportContact,
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            //devicecount
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Device Count",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(user.deviceCount.toString(),
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            const CategoryBuilder(title: "Support Access"),
            //Access Pin
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Access Pin",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("N/A",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            //Valid Till
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("Valid Till",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("N/A",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
            // New Validity
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("New Validity",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      ":",
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text("0 hours",
                        style: Theme.of(context).primaryTextTheme.headline3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

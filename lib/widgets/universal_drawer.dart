import 'package:flutter/material.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/screens/SidebarScreens/account.dart';
import 'package:nudron/screens/SidebarScreens/profile.dart';
import 'package:provider/provider.dart';

import '../screens/SidebarScreens/settings.dart';

class NudronDrawer extends StatefulWidget {
  const NudronDrawer({Key? key}) : super(key: key);

  @override
  State<NudronDrawer> createState() => _NudronDrawerState();
}

class _NudronDrawerState extends State<NudronDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 212, 238, 222),
            ),
            child: Text(
              'Nudron Iot Solutions',
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 10),
                Text(
                  "Profile",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ProfilePage.routeName);
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.book),
                const SizedBox(width: 10),
                Text(
                  "Account",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed(AccountPage.routeName);
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(width: 10),
                Text(
                  "Settings",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.help_outline_rounded),
                const SizedBox(width: 10),
                Text(
                  "FAQ and Help",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.notification_important),
                const SizedBox(width: 10),
                Text(
                  "Notices",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.connect_without_contact),
                const SizedBox(width: 10),
                Text(
                  "Contact Support",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.construction),
                const SizedBox(width: 10),
                Text(
                  "Configuration",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(
              children: [
                const Icon(Icons.arrow_back),
                const SizedBox(width: 10),
                Text(
                  "Back to portal",
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ],
            ),
            onTap: () {
              Provider.of<GlobalConfigProvider>(context, listen: false)
                  .setLevelFour();
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                Text('Log Out', style: TextStyle(color: Colors.red)),
              ],
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}

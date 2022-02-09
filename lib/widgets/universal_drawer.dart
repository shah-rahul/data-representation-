import 'package:flutter/material.dart';

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
                Icon(Icons.person),
                SizedBox(width: 10),
                Text(
                  "userName",
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

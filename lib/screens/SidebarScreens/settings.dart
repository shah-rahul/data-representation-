import 'package:flutter/material.dart';
import 'package:nudron/widgets/sideBar/category_builder.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String routeName = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            const CategoryBuilder(
              title: "Display Settings ",
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  Switch(
                    value: isDarkMode,
                    
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = !value;
                      });
                    },
                  ),
                ],
              ),
            ),
            //a row with text fint size and a dropdown menu
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Font Size',
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  DropdownButton<int>(
                    value: 16,
                    onChanged: (value) {},
                    items: [
                      DropdownMenuItem(
                        value: 16,
                        child: Text(
                          'Normal',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 18,
                        child: Text(
                          'Large',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 20,
                        child: Text(
                          'Small',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CategoryBuilder(
              title: "Table Settings ",
            ),
            //a row with text Sort By and a dropdown menu with alerts and dues
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort By',
                    style: Theme.of(context).primaryTextTheme.headline4,
                  ),
                  DropdownButton<String>(
                    value: 'Due Date',
                    onChanged: (value) {},
                    items: [
                      DropdownMenuItem(
                        value: 'Due Date',
                        child: Text(
                          'Dues',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Alert',
                        child: Text(
                          'Alert',
                          style: Theme.of(context).primaryTextTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

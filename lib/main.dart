import 'package:flutter/material.dart';
import 'package:nudron/config/themedata.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/screens/SidebarScreens/account.dart';
import 'package:nudron/screens/SidebarScreens/profile.dart';
import 'package:nudron/screens/SidebarScreens/settings.dart';
import 'package:nudron/screens/dashboard.dart';
import 'package:nudron/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChartDataProvider()),
        ChangeNotifierProvider(create: (_) => MapDataProvider()),
        ChangeNotifierProvider(create: (_) => TableDataProvider()),
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
        ChangeNotifierProvider(create: (_) => GlobalConfigProvider()),
      ],
      child: MaterialApp(
        title: 'Nudron',
        theme: CustomTheme().theme,
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          DashBoard.routeName : (ctx) => const DashBoard(),
          ProfilePage.routeName: (ctx) => const ProfilePage(),
          AccountPage.routeName: (ctx) => const AccountPage(),
          SettingsPage.routeName: (ctx) => const SettingsPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nudron/config/jwtDecoder.dart';
import 'package:nudron/config/themedata.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/providers/globalConfigProvider.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/providers/tableDataProvider.dart';
import 'package:nudron/providers/userDataProvider.dart';
import 'package:nudron/screens/SidebarScreens/account.dart';
import 'package:nudron/screens/SidebarScreens/profile.dart';
import 'package:nudron/screens/SidebarScreens/settings.dart';
import 'package:nudron/screens/authScreens/emailVfPage.dart';
import 'package:nudron/screens/authScreens/loginPage.dart';
import 'package:nudron/screens/authScreens/numberVfPage.dart';
import 'package:nudron/screens/authScreens/signUpPage.dart';
import 'package:nudron/screens/dashboard.dart';
import 'package:nudron/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String email = "";
  Future<int> returnRoute() async {
    print('test function called');
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    if (_prefs.getString("IdToken") == null) {
      return 0;
    } else {
      String token = _prefs.getString("IdToken") as String;
      var decodedToken = JwtDecoder.decode(token);
      if (decodedToken['email_verified'] == false) {
        email = decodedToken['email'];
        return 1;
      } else if (decodedToken['phone_number_verified'] == false) {
        return 2;
      }
    }

    return 3;
  }

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
        home: FutureBuilder(
            future: returnRoute(),
            initialData: 4,
            builder: (context, snapshot) {
              switch (snapshot.data) {
                case 0:
                  return HomePage();
                case 1:
                  return HomePage();

                  ;
                case 2:
                  return const HomePage();
                case 3:
                  return const HomePage();
                case 4:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return const Login();
              }
            }),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          DashBoard.routeName: (ctx) => const DashBoard(),
          ProfilePage.routeName: (ctx) => const ProfilePage(),
          AccountPage.routeName: (ctx) => const AccountPage(),
          SettingsPage.routeName: (ctx) => const SettingsPage(),
          SignUpPage.routeName: (ctx) => const SignUpPage(),
          Login.routeName: (ctx) => const Login(),
          EmailVerificationPage.routeName: (ctx) => const EmailVerificationPage(
                email: " ",
              ),
          NumberVerificationPage.routeName: (ctx) =>
              const NumberVerificationPage(
                number: "",
              ),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nudron/config/themedata.dart';
import 'package:nudron/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nudron',
      theme: CustomTheme().theme,
      home: const MyHomePage(),
      routes: {
        MyHomePage.routeName: (ctx) => const MyHomePage(),
      },
    );
  }
}

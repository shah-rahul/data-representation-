import 'package:flutter/material.dart';
import 'package:nudron/config/themedata.dart';
import 'package:nudron/providers/chartDataProvider.dart';
import 'package:nudron/providers/mapDataProdiver.dart';
import 'package:nudron/screens/homepage.dart';
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
        ChangeNotifierProvider(create: (_) => MapDataProvider())
      ],
      child: MaterialApp(
        title: 'Nudron',
        theme: CustomTheme().theme,
        home: const MyHomePage(),
        routes: {
          MyHomePage.routeName: (ctx) => const MyHomePage(),
        },
      ),
    );
  }
}

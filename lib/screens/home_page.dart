import 'package:flutter/material.dart';
import 'package:nudron/screens/dashboard.dart';
import 'package:nudron/widgets/utils/dashboard_item.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/homePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nudron"),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dashboards",
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            side: const BorderSide(
                                color: Colors.black87, width: 2),
                            backgroundColor: Colors.black87,
                            fixedSize: const Size(10, 10),
                          ),
                          onPressed: () {},
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 20)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DashBoard.routeName);
                },
                child: DashBoardItemBuilder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

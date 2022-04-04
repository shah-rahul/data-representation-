import 'package:flutter/material.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.grey[400],
            boxShadow: [
              BoxShadow(blurRadius: 10.0, color: Color.fromRGBO(0, 0, 0, 0.1))
            ],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline3,
          ),
        ),
      ),
    );
  }
}

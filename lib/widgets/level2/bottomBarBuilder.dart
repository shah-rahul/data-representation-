import 'package:flutter/material.dart';

class BottombarBuilder extends StatefulWidget {
  const BottombarBuilder({Key? key, required this.fun}) : super(key: key);
  final Function fun;

  @override
  State<BottombarBuilder> createState() => _BottombarBuilderState();
}

var isTappedHome = false;
var isTappedPhone = false;
var isTappedMail = false;
var isTappedAlert = false;

class _BottombarBuilderState extends State<BottombarBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: isTappedHome
                  ? Icon(
                      Icons.home,
                      size: 20,
                      color: Colors.teal,
                    )
                  : Icon(
                      Icons.home_outlined,
                      size: 20,
                    ),
              onPressed: () {
                widget.fun(1);
                setState(() {
                  isTappedHome = !isTappedHome;
                  isTappedPhone = false;
                  isTappedMail = false;
                  isTappedAlert = false;
                });
              },
            ),
            IconButton(
              icon: isTappedPhone
                  ? Icon(
                      Icons.phone,
                      color: Colors.teal,
                      size: 20,
                    )
                  : Icon(
                      Icons.phone_outlined,
                      size: 20,
                    ),
              onPressed: () {
                widget.fun(2);

                setState(() {
                  isTappedPhone = !isTappedPhone;
                  isTappedHome = false;
                  isTappedMail = false;
                  isTappedAlert = false;
                });
              },
            ),
            IconButton(
              icon: isTappedMail
                  ? Icon(
                      Icons.mail,
                      color: Colors.teal,
                      size: 20,
                    )
                  : Icon(
                      Icons.mail_outlined,
                      size: 20,
                    ),
              onPressed: () {
                widget.fun(3);

                setState(() {
                  isTappedMail = !isTappedMail;
                  isTappedHome = false;
                  isTappedPhone = false;
                  isTappedAlert = false;
                });
              },
            ),
            IconButton(
              icon: isTappedAlert
                  ? Icon(
                      Icons.notifications,
                      color: Colors.teal,
                      size: 20,
                    )
                  : Icon(
                      Icons.notifications_outlined,
                      size: 20,
                    ),
              onPressed: () {
                setState(() {
                  isTappedAlert = !isTappedAlert;
                  isTappedHome = false;
                  isTappedPhone = false;
                  isTappedMail = false;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

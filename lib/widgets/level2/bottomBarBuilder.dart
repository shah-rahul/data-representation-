import 'package:flutter/material.dart';

class BottombarBuilder extends StatefulWidget {
  const BottombarBuilder({Key? key}) : super(key: key);

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
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: isTappedHome
                ? Icon(
                    Icons.home,
                    color: Colors.teal,
                  )
                : Icon(Icons.home_outlined),
            onPressed: () {
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
                  )
                : Icon(Icons.phone_outlined),
            onPressed: () {
              setState(() {
                isTappedPhone = !isTappedPhone;
                isTappedHome = false;
                isTappedMail = false;
                isTappedAlert = false;
              });
            },
          ),
          IconButton(
            icon: isTappedMail ?  Icon(Icons.mail, color: Colors.teal,):    Icon(Icons.mail_outlined),
            onPressed: () {
              setState(() {
                isTappedMail = !isTappedMail;
                isTappedHome = false;
                isTappedPhone = false;
                isTappedAlert = false;
              });
          
            },
          ),
          IconButton(
            icon:isTappedAlert ?  Icon(Icons.notifications, color: Colors.teal, ) :   Icon(Icons.notifications_outlined ),
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
    );
  }
}

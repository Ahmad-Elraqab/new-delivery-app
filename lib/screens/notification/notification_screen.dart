import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  static const String routeName = "/NotificationPage";

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: MyNav(),
      body: Container(
        height: 100,
        width: 100,
        color: Colors.yellow,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:konkuk_student_app/dashboard.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(
      color: Colors.black87,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text('User Profile'),
    titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.bold,),
    centerTitle: true,
  );
}
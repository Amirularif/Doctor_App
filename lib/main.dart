import 'package:flutter/material.dart';
import 'package:Doctor_App/bottombar.dart';
import 'package:Doctor_App/dashboard.dart';
import 'package:Doctor_App/statistics/PatientInfoPage.dart';
import 'PatientListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

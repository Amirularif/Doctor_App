import 'package:flutter/material.dart';
import 'package:Doctor_App/dashboard.dart';
import 'package:Doctor_App/profile/profilemain.dart';
import 'package:Doctor_App/statistics/stats_card.dart';

class StatsDetail extends StatelessWidget {
  final assetPath, user_name, user_age, user_gender, user_fitbitID;

  StatsDetail({this.assetPath, this.user_name, this.user_age, this.user_gender, this.user_fitbitID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Detail',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
      ),

      body: ListView(
          children: [
            SizedBox(height: 25.0),
            Hero(
                tag: assetPath,
                child: Image.asset(assetPath,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(user_name,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF575E67))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(user_age,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 20.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(user_gender,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 20.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(user_fitbitID,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 20.0)),
            ),
          ]
      ),
    );
  }
}


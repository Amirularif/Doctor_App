import 'package:flutter/material.dart';
import 'package:konkuk_student_app/dashboard.dart';
import 'package:konkuk_student_app/profile/profilemain.dart';
import 'package:konkuk_student_app/statistics/stats_card.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
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
        title: Text('Statistics'),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,),
        centerTitle: true,),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                StatsCards(
                  activity: 'Cooking',
                  mood: 'Stressed',
                  date: '24 June 2022',
                  time: '07:40 am',
                  color: Colors.lightGreen.shade200,
                ),
                StatsCards(
                  activity: 'Watching TV',
                  mood: 'Neutral',
                  date: '24 June 2022',
                  time: '18:35 pm',
                  color: Colors.lightBlue.shade100,
                ),
                StatsCards(
                  activity: 'Reading',
                  mood: 'Calm',
                  date: '24 June 2022',
                  time: '20:02 pm',
                  color: Colors.amber.shade100,
                ),
              ],
            ),

            ),
          ),
        ),
    );
  }
}


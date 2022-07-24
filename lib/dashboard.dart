import 'package:flutter/material.dart';
import 'package:konkuk_student_app/graph/FitHeart.dart';
import 'package:konkuk_student_app/graph/FitSleep.dart';
import 'package:konkuk_student_app/graph/FitStep.dart';
import 'package:konkuk_student_app/graph/FitWeight.dart';
import 'package:konkuk_student_app/graph/graph_cards.dart';
import 'package:konkuk_student_app/profile/profilemain.dart';
import 'package:konkuk_student_app/profile/user.dart';
import 'package:konkuk_student_app/profile/user_preferences.dart';
import 'package:konkuk_student_app/statistics/stats_page.dart';
import 'package:konkuk_student_app/util/emoticons.dart';
import 'package:konkuk_student_app/util/save_sucess.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User user = UserPreferences.myUser;
  

  bool tappedDone = false;

  //scroll controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //hi user!
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('24 June, 2022',
                          style: TextStyle(color: Colors.black87),
                        ),
                        ],
                      ),

                      //profile
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileMain()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey.shade100,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //menu title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fitbit Data',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //fitbit
                  Container(
                    height: 220,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                          controller: _controller,
                          children: [
                            FitHeartGraph(token: user.fitbitToken),
                            FitStepGraph(token: user.fitbitToken),
                            FitSleepGraph(token: user.fitbitToken),
                            FitWeightGraph(token: user.fitbitToken),
                          ],
                      )
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  //scroll bar
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.grey.shade600,
                        dotHeight: 5,
                        dotWidth: 5,
                      ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //activity log title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Activity & Mood Log',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //activity log box
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Input activity name here',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //emoticons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //very calm
                      Column(
                        children: [
                          Emoticons(
                            emoticon: 'assets/emoticons/verycalm.png',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Very Calm',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      //calm
                      Column(
                        children: [
                          Emoticons(
                            emoticon: 'assets/emoticons/calm.png',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Calm',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      //neutral
                      Column(
                        children: [
                          Emoticons(
                            emoticon: 'assets/emoticons/neutral.png',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Neutral',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      //stressed
                      Column(
                        children: [
                          Emoticons(
                            emoticon: 'assets/emoticons/stressed.png',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Stressed',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),

                      //very stressed
                      Column(
                        children: [
                          Emoticons(
                            emoticon: 'assets/emoticons/verystressed.png',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Very Stressed',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),

                  //input button
                  GestureDetector(
                    onTap: ()async {
                      final action = await SaveSuccess.doneDialog(context, 'Success', 'Activity and mood successfully logged !');
                      if(action == DialogsAction.done) {
                        setState(() => tappedDone = true);
                      } else {
                        setState(() => tappedDone = false);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Log Data',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //stats page button
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatsPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Statistics',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}


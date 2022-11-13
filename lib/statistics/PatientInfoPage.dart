import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:Doctor_App/graph/FitHeart.dart';
import 'package:Doctor_App/graph/FitSleep.dart';
import 'package:Doctor_App/graph/FitStep.dart';
import 'package:Doctor_App/graph/FitWeight.dart';
import 'package:Doctor_App/graph/graph_cards.dart';
import 'package:Doctor_App/profile/profilemain.dart';
import 'package:Doctor_App/profile/user.dart';
import 'package:Doctor_App/profile/user_preferences.dart';
import 'package:Doctor_App/util/emoticons.dart';
import 'package:Doctor_App/util/save_sucess.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';
import '../PatientListPage.dart';
import '../bottombar.dart';
import '../dashboard.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  late List<WidgetData> data;
  User user = UserPreferences.myUser;
  int selectedindex = 2;

  void initState(){
  }

  bool tappedDone = false;

  //scroll controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {

    final List<WidgetData> chartData = [
      WidgetData('Student survey', 25),
      WidgetData('GAD-7', 38),
      WidgetData('Log', 34),
    ];

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: selectedindex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() {
            selectedindex = index;
            if (index == 0) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Dashboard()));
            }else if (index == 1) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PatientListPage()));
            }else if (index == 2) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PatientPage()));
            }else if (index == 3) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Dashboard()));
            }
          }),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.logout),
              title: Text('Logout'),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
                            'Patient Info',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 140,
                                width: 325,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(10.0),
                                child : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: (){
                                        },
                                        child: Container(
                                            height: 90,
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                image: const DecorationImage(
                                                    image: AssetImage('assets/profile/telur.jpg'),
                                                    fit: BoxFit.cover)
                                            )
                                        )
                                    ),

                                    SizedBox(
                                      width: 12,
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        //name
                                        Text('Nik Amir',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        //age
                                        Text('Age        : 23',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13,
                                          ),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        //gender
                                        Text('Gender  : Male',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13,
                                          ),),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        //fitbit ID
                                        Text('Fitbit ID : 20191652398',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 13,
                                          ),),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        IconButton(onPressed: (){},
                                            icon : Icon(Icons.message),
                                            color: Colors.grey,
                                            iconSize: 20),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        IconButton(onPressed: (){},
                                            icon : Icon(Icons.call),
                                            color: Colors.grey,
                                            iconSize: 20),
                                      ],
                                    )
                                  ],
                                )
                            ),
                              SizedBox(width: 20,),

                              Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(5.0),

                                child :CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 7.0,
                                  animation: true,
                                  percent: 0.55,
                                  center: new Text(
                                    "55.0%",
                                    style:
                                    new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 15.0),
                                  ),
                                  linearGradient: LinearGradient(
                                    begin: Alignment.topRight,end:Alignment.bottomLeft,
                                    colors: <Color> [Colors.grey.shade900,Colors.grey.shade900],
                                  ),
                                  footer: new Text(
                                    "\nGAD-7 완성률 ",
                                    style:
                                    new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 11.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  rotateLinearGradient: true,
                                ),
                              ),
                              SizedBox(width: 20,),

                              Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 7.0,
                                  animation: true,
                                  percent: 0.3,
                                  center: new Text(
                                    "25.0%",
                                    style:
                                    new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 15.0),
                                  ),
                                  linearGradient: LinearGradient(
                                    begin: Alignment.topRight,end:Alignment.bottomLeft,
                                    colors: <Color> [Colors.grey.shade900,Colors.grey.shade900],
                                  ),
                                  footer: new Text(
                                    "\n학생 조사 완성률 ",
                                    style:
                                    new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 11.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  rotateLinearGradient: true,
                                ),
                              ),
                              SizedBox(width: 20,),

                              Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(10.0),
                                child: CircularPercentIndicator(
                                  radius: 40.0,
                                  lineWidth: 7.0,
                                  animation: true,
                                  percent: 0.8,
                                  center: new Text(
                                    "85.0%",
                                    style:
                                    new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 15.0),
                                  ),
                                  linearGradient: LinearGradient(
                                    begin: Alignment.topRight,end:Alignment.bottomLeft,
                                    colors: <Color> [Colors.grey.shade900,Colors.grey.shade900],
                                  ),
                                  footer: new Text(
                                    "\n라이프로그 ",
                                    style:
                                    new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 11.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  rotateLinearGradient: true,
                                ),
                              ),
                              SizedBox(width: 20,),
                            ],
                          ),

                        ],
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
                        'Data',
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
                      height: 360,
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
                  //widget

                ],
              ),
            ),
          ),
        )
    );
  }
}

class WidgetData {
  WidgetData(this.x, this.y);
  final String x;
  final double y;
}
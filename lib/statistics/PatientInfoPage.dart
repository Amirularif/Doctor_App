import 'package:Doctor_App/ChatPage.dart';
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
  double _height = 170.0;
  double _width = 140.0;
  double _height1 = 170.0;
  double _width1 = 140.0;
  bool _isExpanded = false;
  bool isExpanded2 = false;
  bool tappedDone = false;

  List<Message> messages = [
    Message(
      status: "Completed",
      score: "56",
      date: "22/10/2022",
      color: Colors.green.shade400,),
    Message(
      status: "Not Completed",
      score: " 0",
      date: "23/10/2022",
      color: Colors.red.shade400,),
    Message(
      status: "Completed",
      score: "60",
      date: "23/10/2022",
      color: Colors.green.shade400,),
    Message(
      status: "Completed",
      score: "45",
      date: "25/10/2022",
      color: Colors.green.shade400,),
    Message(
      status: "Not Completed",
      score: " 0",
      date: "22/10/2022",
      color: Colors.red.shade400,),
  ];
  List<Message1> messages1 = [
    Message1(
      activity: "Playing games",
      mood: "Stressed",
      dateandtime: "22/10/2022, 12:04 AM",
      color: Colors.yellow.shade400,),
    Message1(
      activity: "Watching anime",
      mood: "Calm",
      dateandtime: "22/10/2022, 01:43 AM",
      color: Colors.blue.shade200,),
    Message1(
      activity: "Cooking",
      mood: "Neutral",
      dateandtime: "22/10/2022, 19:15 PM",
      color: Colors.yellow.shade200,),
    Message1(
      activity: "Late for class",
      mood: "Stressed",
      dateandtime: "22/10/2022, 10:05 AM",
      color: Colors.yellow.shade400,),
    Message1(
      activity: "Studying",
      mood: "Very Stressed",
      dateandtime: "22/10/2022, 02:40 AM",
      color: Colors.yellow.shade700,),
  ];

  Future<bool> _showList() async {
    await Future.delayed(Duration(milliseconds: 300));
    return true;
  }

  Future<bool> _showListtwo() async {
    await Future.delayed(Duration(milliseconds: 300));
    return true;
  }



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
                  MaterialPageRoute(builder: (context) => HomePage()));
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
                                  height: 170,
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
                                                  image: DecorationImage(
                                                      image: AssetImage('assets/profile/toby.jpg'),
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
                                            height: 30,
                                          ),
                                          //name
                                          Text('홍길동',
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
                                          Text('Fitbit ID : 2476374753456',
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
                                            height: 30,
                                          ),
                                          IconButton(onPressed: (){
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) => HomePage()));
                                          },
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

                              SizedBox(
                                width: 20,
                              ),

                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: _height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: _width,
                                padding: EdgeInsets.only(left: 15, right: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (!_isExpanded) {
                                                setState(() {
                                                  _height = 170;
                                                  _width = 420;
                                                  _isExpanded = true;
                                                });
                                              } else {
                                                setState(() {
                                                  _height = 170;
                                                  _width = 140;
                                                  _isExpanded = false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 140,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              padding: EdgeInsets.only(top: 10.0,left: 10.0),
                                              child: CircularPercentIndicator(
                                                radius: 40.0,
                                                lineWidth: 7.0,
                                                animation: true,
                                                percent: 0.8,
                                                center: new Text(
                                                  "80.0%",
                                                  style:
                                                  new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 15.0),
                                                ),
                                                linearGradient: LinearGradient(
                                                  begin: Alignment.topRight,end:Alignment.bottomLeft,
                                                  colors: <Color> [Colors.grey.shade900,Colors.grey.shade900],
                                                ),
                                                footer: new Text(
                                                  "\n조사로그 완성률 ",
                                                  style:
                                                  new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 11.0),
                                                ),
                                                circularStrokeCap: CircularStrokeCap.round,
                                                rotateLinearGradient: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _isExpanded
                                        ? FutureBuilder(
                                        future: _showList(),
                                        /// will wait untill box animation completed
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return SizedBox();
                                          }
                                          return Container(
                                            height: 140,
                                            width: 280,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12)
                                            ),
                                            padding: EdgeInsets.all(5.0),
                                            child:ListView.separated(
                                                itemBuilder: (context,index){
                                                  return listViewItem(index);
                                                },
                                                separatorBuilder: (context,index){
                                                  return Divider(height: 1,thickness: 2,);
                                                },
                                                itemCount: messages.length),
                                          );
                                        })
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              ),

                              SizedBox(
                                width: 20,
                              ),

                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                height: _height1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: _width1,
                                padding: EdgeInsets.only(left: 15, right: 5),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (!isExpanded2) {
                                                setState(() {
                                                  _height1 = 170;
                                                  _width1 = 420;
                                                  isExpanded2 = true;
                                                });
                                              } else {
                                                setState(() {
                                                  _height1 = 170;
                                                  _width1 = 140;
                                                  isExpanded2 = false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 140,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              padding: EdgeInsets.only(top: 10.0, left: 10.0),
                                              child: CircularPercentIndicator(
                                                radius: 40.0,
                                                lineWidth: 7.0,
                                                animation: true,
                                                percent: 0.7,
                                                center: new Text(
                                                  "70.0%",
                                                  style:
                                                  new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 15.0),
                                                ),
                                                linearGradient: LinearGradient(
                                                  begin: Alignment.topRight,end:Alignment.bottomLeft,
                                                  colors: <Color> [Colors.grey.shade900,Colors.grey.shade900],
                                                ),
                                                footer: new Text(
                                                  "\n무드로그 완성률 ",
                                                  style:
                                                  new TextStyle(color: Colors.grey.shade900,fontWeight: FontWeight.bold, fontSize: 11.0),
                                                ),
                                                circularStrokeCap: CircularStrokeCap.round,
                                                rotateLinearGradient: true,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    isExpanded2
                                        ? FutureBuilder(
                                        future: _showListtwo(),
                                        /// will wait untill box animation completed
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return SizedBox();
                                          }
                                          return Container(
                                            height: 140,
                                            width: 280,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12)
                                            ),
                                            padding: EdgeInsets.all(5.0),
                                            child:ListView.separated(
                                                itemBuilder: (context,index){
                                                  return listViewItem1(index);
                                                },
                                                separatorBuilder: (context,index){
                                                  return Divider(height: 2);
                                                },
                                                itemCount: messages.length),
                                          );
                                        })
                                        : SizedBox.shrink(),

                                  ],
                                ),
                              ),
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
                      height: 300,
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
  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefixIcon(),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding:EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        surveyinfo(index),
                        timeanddate(index),
                      ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        scoreIcon(index)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  Widget listViewItem1(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding:EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        moodinfo(index),
                        timeanddate1(index),
                      ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        moodIcon(index)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }

  Widget moodinfo(int index) {
    final info = messages1[index];
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: info.activity,
          style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget surveyinfo(int index) {
    final info = messages[index];
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: '조사 날짜 : ',
            style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
                fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                  text: info.date,
                  style: TextStyle(
                      fontWeight: FontWeight.w600
                  )
              ),
            ]
        ),
      ),
    );
  }

  Widget timeanddate(int index) {
    final info = messages[index];
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text(info.status,
              style: TextStyle(
                  fontSize: 10),
            ),
          ]
      ),
    );
  }

  Widget timeanddate1(int index) {
    final info = messages1[index];
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text(info.dateandtime,
              style: TextStyle(
                  fontSize: 10),
            ),
          ]
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 30,
      width: 30,
      padding: EdgeInsets.all(2),
      child: Icon(
        Icons.monitor_heart_rounded,
        size: 25,
        color: Colors.redAccent.shade200,
      ),
    );
  }

  Widget scoreIcon(int index) {
    final info = messages[index];
    return Container(
      height: 30,
      width: 30,
      padding: EdgeInsets.only(left: 6,top: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: info.color,
      ),
      child: Text(info.score,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,),

      ),
    );
  }

  Widget moodIcon(int index) {
    final info = messages1[index];
    return Container(
      height: 30,
      width: 100,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: info.color,
      ),
      child: Center(
        child: Text(info.mood,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,),

        ),
      ),
    );
  }
}


class WidgetData {
  WidgetData(this.x, this.y);
  final String x;
  final double y;
}
class Message{
  final String status;
  final String score;
  final String date;
  final Color color;

  const Message({
    required this.status,
    required this.score,
    required this.date,
    required this.color,
  });
}

class Message1{
  final String activity;
  final String mood;
  final String dateandtime;
  final Color color;

  const Message1({
    required this.activity,
    required this.mood,
    required this.dateandtime,
    required this.color,
  });
}
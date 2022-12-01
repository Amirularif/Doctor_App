import 'package:flutter/material.dart';
import 'package:Doctor_App/PatientListPage.dart';
import 'package:Doctor_App/graph/FitHeart.dart';
import 'package:Doctor_App/graph/FitSleep.dart';
import 'package:Doctor_App/graph/FitStep.dart';
import 'package:Doctor_App/graph/FitWeight.dart';
import 'package:Doctor_App/graph/graph_cards.dart';
import 'package:Doctor_App/profile/profilemain.dart';
import 'package:Doctor_App/profile/user.dart';
import 'package:Doctor_App/profile/user_preferences.dart';
import 'package:Doctor_App/startup/login/login.dart';
import 'package:Doctor_App/statistics/PatientInfoPage.dart';
import 'package:Doctor_App/util/emoticons.dart';
import 'package:Doctor_App/util/save_sucess.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';
import 'package:Doctor_App/statistics/stats_card.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'bottombar.dart';
import 'graph/CompletionRate.dart';
import 'graph/NumPatient.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User user = UserPreferences.myUser;
  String date = '';
  int selectedindex = 0;
  late Widget selectedWidget;
  
  String dateinit(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  void initState(){
    date = dateinit();
    selectedWidget = const Dashboard();
    super.initState();
  }

  bool tappedDone = false;

  //scroll controller
  late final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: selectedindex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() {
            selectedindex = index;
            print(index);
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
                  MaterialPageRoute(builder: (context) => LoginPage()));
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
                      //TOP bar
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
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
                          Text(date,
                          style: TextStyle(color: Colors.black87),
                        ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Patients',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                   height: 300,
                   width: 1200,
                   decoration: BoxDecoration(
                     color: Colors.grey.shade300,
                     borderRadius: BorderRadius.circular(12)
                   ),
                   padding: EdgeInsets.all(10),
                   child: ListView(
                     children: [
                       Column(
                        children:[
                          Row(
                           children: [
                             StatsCards(
                               username: 'Name : 아미룰',
                               age: 'Age : 23',
                               gender: 'Gender : Male',
                               fitbitID: 'fitbit ID : 20191',
                               imgPath: 'assets/profile/toby.jpg',
                               color: Colors.white70,
                             ),
                             SizedBox(
                               width: 10,
                             ),
                             StatsCards(
                             username: 'Name : 하니',
                             age: 'Age : 22',
                             gender: 'Gender : Female',
                             fitbitID: 'fitbit ID : 20192',
                               imgPath: 'assets/profile/zendaya.jpg',
                             color: Colors.white70,
                           ),
                             SizedBox(
                               width: 10,
                             ),
                             StatsCards(
                               username: 'Name : 작완',
                               age: 'Age : 24',
                               gender: 'Gender : Male',
                               fitbitID: 'fitbit ID : 20193',
                               imgPath: 'assets/profile/tom.jpg',
                               color: Colors.white70,
                             ),
                             SizedBox(
                               width: 10,
                             ),
                             StatsCards(
                               username: 'Name : 아미룰',
                               age: 'Age : 23',
                               gender: 'Gender : Male',
                               fitbitID: 'fitbit ID : 20191',
                               imgPath: 'assets/profile/profile.jpg',
                               color: Colors.white70,
                             ),
                           ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                             children:[
                               StatsCards(
                                 username: 'Name : 이길동',
                                 age: 'Age : 24',
                                 gender: 'Gender : Male',
                                 fitbitID: 'fitbit ID : 20193',
                                 imgPath: 'assets/profile/andrew.jpg',
                                 color: Colors.white70,
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               StatsCards(
                                 username: 'Name : 홍길동',
                                 age: 'Age : 24',
                                 gender: 'Gender : Male',
                                 fitbitID: 'fitbit ID : 20193',
                                 imgPath: 'assets/profile/profile.jpg',
                                 color: Colors.white70,
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               StatsCards(
                                 username: 'Name : 하니',
                                 age: 'Age : 22',
                                 gender: 'Gender : Female',
                                 fitbitID: 'fitbit ID : 20192',
                                 imgPath: 'assets/profile/profile.jpg',
                                 color: Colors.white70,
                               ),
                               SizedBox(
                                 width: 10,
                               ),
                               StatsCards(
                                 username: 'Name : 작완',
                                 age: 'Age : 24',
                                 gender: 'Gender : Male',
                                 fitbitID: 'fitbit ID : 20193',
                                 imgPath: 'assets/profile/profile.jpg',
                                 color: Colors.white70,
                               ),
                              ],),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              StatsCards(
                                username: 'Name : 이길동',
                                age: 'Age : 24',
                                gender: 'Gender : Male',
                                fitbitID: 'fitbit ID : 20193',
                                imgPath: 'assets/profile/profile.jpg',
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatsCards(
                                username: 'Name : 홍길동',
                                age: 'Age : 24',
                                gender: 'Gender : Male',
                                fitbitID: 'fitbit ID : 20193',
                                imgPath: 'assets/profile/profile.jpg',
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatsCards(
                                username: 'Name : 이길동',
                                age: 'Age : 24',
                                gender: 'Gender : Male',
                                fitbitID: 'fitbit ID : 20193',
                                imgPath: 'assets/profile/profile.jpg',
                                color: Colors.white70,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              StatsCards(
                                username: 'Name : 홍길동',
                                age: 'Age : 24',
                                gender: 'Gender : Male',
                                fitbitID: 'fitbit ID : 20193',
                                imgPath: 'assets/profile/profile.jpg',
                                color: Colors.white70,
                              ),
                            ],
                          )
                        ],),
                        ],),
                      ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Information',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      height: 146,
                      width: 1260,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        children: [
                          PatientGraphPage(),
                          SurveyGraphPage(),
                        ],
                      ),
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
                ],),
            ),
          ),
        ),
    );
  }
  void onPressed(index) {
    setState(() {
      print(index);
      selectedindex = index;
      if (index == 0) {
        selectedWidget = const Dashboard();
        print("hai");
      }else if (index == 1) {
        selectedWidget = const PatientPage();
        print("hai");
      }else if (index == 2) {
        selectedWidget = const Dashboard();
      }else if (index == 3) {
        selectedWidget = const LoginPage();
      }
    });
  }
}


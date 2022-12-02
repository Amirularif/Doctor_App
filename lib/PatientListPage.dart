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
import 'package:Doctor_App/startup/login/login.dart';
import 'package:Doctor_App/statistics/PatientInfoPage.dart';
import 'package:Doctor_App/statistics/stats_card.dart';
import 'package:Doctor_App/util/emoticons.dart';
import 'package:Doctor_App/util/save_sucess.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';
import '../bottombar.dart';
import '../dashboard.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({Key? key}) : super(key: key);

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  String date = '';
  List<Patient> users = [
    const Patient(
        name: '아미룰',
        fitbitid: '20191235689',
        imgpath: 'assets/profile/toby.jpg'),
    const Patient(
        name: '하니',
        fitbitid: '20191234687',
        imgpath: 'assets/profile/zendaya.jpg'),
    const Patient(
        name: '작완',
        fitbitid: '20191907632',
        imgpath: 'assets/profile/andrew.jpg'),
    const Patient(
        name: '홍길동',
        fitbitid: '20191652398',
        imgpath: 'assets/profile/profile.jpg'),
    const Patient(
        name: '이길동',
        fitbitid: '20191235689',
        imgpath: 'assets/profile/tom.jpg'),
    const Patient(
        name: '하니',
        fitbitid: '20191234687',
        imgpath: 'assets/profile/profile.jpg'),
    const Patient(
        name: '작완',
        fitbitid: '20191907632',
        imgpath: 'assets/profile/profile.jpg'),
    const Patient(
        name: '홍길동',
        fitbitid: '20191652398',
        imgpath: 'assets/profile/profile.jpg'),
  ];
  int selectedindex = 0;

  String dateinit(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  void initState(){
    date = dateinit();
  }

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
                    MaterialPageRoute(builder: (context) => PatientListPage()));
              }else if (index == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PatientPage()));
              }else if (index == 2) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()));
              }else if (index == 3) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }
            }),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Home'),
                activeColor: Colors.red,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.info),
                title: Text('Info'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Chat'),
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
              padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '  Main Page',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('    '+date,
                        style: TextStyle(color: Colors.black87,fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '   Patient List',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    Container(
                        height: 570,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        padding: EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context,index) {
                          final user = users[index];
                          return Card(
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child:Image(image: AssetImage(user.imgpath),
                                  fit: BoxFit.cover))),
                                title: Text(user.name),
                                subtitle: Text(user.fitbitid),
                                trailing: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => PatientPage()));
                                    }, icon : Icon(Icons.arrow_forward)),
                            ),
                          );
                      },)
                      )
                    ])
                  )
                )
              )
            );
          }
        }
class Patient{
  final String name;
  final String fitbitid;
  final String imgpath;

  const Patient({
    required this.name,
    required this.fitbitid,
    required this.imgpath,
});
}
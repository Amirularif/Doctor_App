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


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  late Widget selectedWidget;

  void initState(){
    selectedWidget = HomePage();
    super.initState();
  }

  List<Contacts> contacts = [
    Contacts(
        name: "Nik",
        recentmsg: "Don't fprget to do your survey",
        time: "7:05 am",
        imgpath: 'assets/profile/toby.jpg'),
    Contacts(
        name: "Amirul",
        recentmsg: "Drink more water.",
        time: "9:15 am",
        imgpath: 'assets/profile/zendaya.jpg'),
    Contacts(
        name: "Hani",
        recentmsg: "Rest Well.",
        time: "12:55 pm",
        imgpath: 'assets/profile/andrew.jpg'),
    Contacts(
        name: "Hikary",
        recentmsg: "Don't forget to update your fitbit token.",
        time: "10:55 am",
        imgpath: 'assets/profile/profile.jpg'),
    Contacts(
        name: "Atirah",
        recentmsg: "Don't forget to do your survey.",
        time: "7:05 am",
        imgpath: 'assets/profile/tom.jpg'),
    Contacts(
        name: "Nik",
        recentmsg: "Don't fprget to do your survey",
        time: "7:05 am",
        imgpath: 'assets/profile/toby.jpg'),
    Contacts(
        name: "Amirul",
        recentmsg: "Drink more water.",
        time: "9:15 am",
        imgpath: 'assets/profile/zendaya.jpg'),
    Contacts(
        name: "Hani",
        recentmsg: "Rest Well.",
        time: "12:55 pm",
        imgpath: 'assets/profile/andrew.jpg'),
    Contacts(
        name: "Hikary",
        recentmsg: "Don't forget to update your fitbit token.",
        time: "10:55 am",
        imgpath: 'assets/profile/profile.jpg'),
    Contacts(
        name: "Atirah",
        recentmsg: "Don't forget to do your survey.",
        time: "7:05 am",
        imgpath: 'assets/profile/tom.jpg'),
    Contacts(
        name: "Hikary",
        recentmsg: "Don't forget to update your fitbit token.",
        time: "10:55 am",
        imgpath: 'assets/profile/profile.jpg'),
    Contacts(
        name: "Atirah",
        recentmsg: "Don't forget to do your survey.",
        time: "7:05 am",
        imgpath: 'assets/profile/tom.jpg'),
  ];
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
                MaterialPageRoute(builder: (context) => HomePage()));
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
            padding: const EdgeInsets.fromLTRB(20.0,20.0,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Messages',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 700,
                            width: 320,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(
                                  right:BorderSide(width: 2.0, color: Colors.grey.shade400),
                                ),
                                color: Colors.grey.shade100),
                            child: ListView.separated(
                                itemBuilder: (context,index){
                                  return listViewItem(index);
                                },
                                separatorBuilder: (context,index){
                                  return Divider(height: 0, thickness: 1,);
                                },
                                itemCount: contacts.length),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 530,
                            width: 880,
                            padding: EdgeInsets.fromLTRB(10,10,10,10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100),
                            child: ChatPage(),
                          ),
                          Container(
                            height: 100,
                            width: 940,
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300),
                            child:  _formChat(),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemChats({String avatar = ''}) {
    return GestureDetector(
      onTap: () {
      },
      child: Card(
        margin: EdgeInsets.only(top: 30,left: 2,right:2),
        elevation: 0,
          color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Avatar(
              margin: EdgeInsets.all(2),
              size: 80,
              image: avatar,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemChatstwo({String avatar = ''}){
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        margin: EdgeInsets.only(top: 30,left: 2,right:2),
        elevation: 0,
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Avatar(
              margin: EdgeInsets.all(2),
              size: 80,
              image: avatar,
            ),
          ],
        ),
      ),
    );
  }

  Widget _formChat() {
    return Positioned(
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 800,
              margin: EdgeInsets.only(left: 8,top: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,),
              color: Colors.grey.shade300,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: TextStyle(fontSize: 12),
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              margin: EdgeInsets.only(left: 8,top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueAccent),
              padding: EdgeInsets.all(14),
              child: Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImgIcon(index),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                padding:EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    patientname(index),
                    timeanddate(index),
                  ],),
              ),
            ),
          ]),
    );
  }

  Widget patientname(int index) {
    final info = contacts[index];
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: 'Name : ',
            style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
                fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                  text: info.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w400
                  )
              )
            ]
        ),
      ),
    );
  }

  Widget timeanddate(int index) {
    final info = contacts[index];
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text(
              info.recentmsg,
              style: TextStyle(
                  fontSize: 10),
            ),
            Text(
              info.time,
              style: TextStyle(
                  fontSize: 10),
            ),
          ]
      ),
    );
  }

  Widget ImgIcon(int index) {
    final info = contacts[index];
    return GestureDetector(
      onTap: (){},
      child: Container(
      width: 50,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 1,
            color: Colors.blue.shade300),
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(info.imgpath),
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
        selectedWidget = HomePage();
        print("hai");
      }else if (index == 1) {
        selectedWidget = const PatientPage();
        print("hai");
      }else if (index == 2) {
        selectedWidget = const PatientListPage();
      }else if (index == 3) {
        selectedWidget = const LoginPage();
      }
    });
  }
}

class Contacts {
  final String name;
  final String recentmsg;
  final String time;
  final String imgpath;

  const Contacts({
    required this.name,
    required this.recentmsg,
    required this.time,
    required this.imgpath,
  });
}

class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _bodyChat(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            _itemChat(
              chat: 0,
              message:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Okey 🐣',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'It has survived not only five centuries, 😀',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
              'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'Okey 🐣',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message: 'It has survived not only five centuries, 😀',
              time: '18.00',
            ),
            _itemChat(
              chat: 0,
              message:
              'Contrary to popular belief, Lorem Ipsum is not simply random text. 😎',
              time: '18.00',
            ),
          ],
        ),
      ),
    );
  }

  // 0 = Send
  // 1 = Recieved
  _itemChat({int? chat, String? avatar, message, time}) {
    return Row(
      mainAxisAlignment:
      chat == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        avatar != null
            ? Avatar(
          image: avatar,
          size: 50,
        )
            : Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400),
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: chat == 0 ? Colors.grey.shade300: Colors.grey.shade300,
            ),
            child: Text('$message'),
          ),
        ),
        chat == 1
            ? Text(
          '$time',
          style: TextStyle(color: Colors.grey.shade400),
        )
            : SizedBox(),
      ],
    );
  }

}

class Avatar extends StatelessWidget {
  final double size;
  final image;
  final EdgeInsets margin;

  Avatar({this.image, this.size = 80, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              width: 2,
              color: Colors.blue.shade300),
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}


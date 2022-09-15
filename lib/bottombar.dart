import 'package:flutter/material.dart';
import 'package:Doctor_App/dashboard.dart';
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

import 'PatientListPage.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  User user = UserPreferences.myUser;
  String date = '';
  int selectedindex = 0;
  late Widget selectedWidget;

  void initState(){
    selectedWidget = const Dashboard();
    super.initState();
  }

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
        onItemSelected: onPressed,
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
      body: selectedWidget,
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
        selectedWidget = const PatientListPage();
        print("hai");
      }else if (index == 2) {
        selectedWidget = const Dashboard();
      }else if (index == 3) {
        selectedWidget = const LoginPage();
      }
    });
  }
}


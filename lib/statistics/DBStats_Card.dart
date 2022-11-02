import 'package:Doctor_App/ServerDB/DBProfile.dart';
import 'package:flutter/material.dart';
import 'package:Doctor_App/statistics/PatientInfoPage.dart';

import '../ServerDB/DBUser.dart';

class DBStatsCards extends StatefulWidget {
  final String Uid;

  const DBStatsCards({
    Key? key,
    required this.Uid
  }) : super(key: key);

  @override
  State<DBStatsCards> createState() => _DBStatsCardsState(Uid);
}

class _DBStatsCardsState extends State<DBStatsCards> {
  String UID;
  _DBStatsCardsState(this.UID);

  var userProf;
  var userList;
  Future DBLoad() async{
    userList = await ProfileData.connect(UID);
    userProf = User(
      Uid: userList[0]["Uid"],
      Name: userList[0]["Name"],
      Gender: userList[0]["Gender"],
      Weight: userList[0]["Weight"],
      Age: userList[0]["Age"],
      Reg: userList[0]["Reg"],
      Email: userList[0]["Email"],
      Phone: userList[0]["Phone"],
      Token: userList[0]["Token"],
      Image: userList[0]["Image"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBLoad(),
        builder: (context, snapshot){
          if(userList != null){
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PatientPage()),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1.5,
                            blurRadius: 2.0
                        )
                      ],
                    ),
                    child : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                          },
                          child: Hero(tag: userProf.Image,
                              child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                          image: AssetImage(userProf.Image),
                                          fit: BoxFit.cover)))),

                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //activity
                            Text(
                              userProf.Name,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold
                              ),),
                            //mood
                            Text(
                              userProf.Age,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 9,
                              ),),
                            //date
                            Text(
                              userProf.Gender,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 9,
                              ),),
                            //time
                            Text(
                              userProf.Uid,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 9,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          else{
            return const Scaffold(
                body:Center(child: CircularProgressIndicator())
            );//
          }
        }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:Doctor_App/statistics/PatientInfoPage.dart';
import '../profile/profilemain.dart';

class StatsCards extends StatefulWidget {
  final String username;
  final String age;
  final String gender;
  final String fitbitID;
  final String imgPath;
  final color;

  const StatsCards({
    Key? key,
    required this.username,
    required this.age,
    required this.gender,
    required this.fitbitID,
    required this.imgPath,
    required this.color
  }) : super(key: key);

  @override
  State<StatsCards> createState() => _StatsCardsState();
}

class _StatsCardsState extends State<StatsCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  blurRadius: 2.0)
            ],
          ),
          child : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            GestureDetector(
              onTap: (){
              },
                child: Hero(tag: widget.imgPath,
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage(widget.imgPath),
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
                    widget.username,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                    ),),
                  //mood
                  Text(
                    widget.age,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 9,
                    ),),
                  //date
                  Text(
                    widget.gender,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 9,
                    ),),
                  //time
                  Text(
                    widget.fitbitID,
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
    );
  }
}

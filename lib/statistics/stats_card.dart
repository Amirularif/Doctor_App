import 'package:flutter/material.dart';

class StatsCards extends StatefulWidget {
  final String activity;
  final String mood;
  final String date;
  final String time;
  final color;

  const StatsCards({
    Key? key,
    required this.activity,
    required this.mood,
    required this.date,
    required this.time,
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
      child: Container(
        width: 320,
        height: 130,
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //activity
            Text(
              widget.activity,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
            //mood
            Text(
              widget.mood,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(
              height: 5,
            ),
            //date
            Text(
              widget.date,
              style: TextStyle(
                  color: Colors.black87,
                  fontStyle: FontStyle.italic
              ),),
            //time
            Text(
              widget.time,
              style: TextStyle(
                  color: Colors.black87,
                  fontStyle: FontStyle.italic
              ),),
          ],
        ),
      ),
    );
  }
}

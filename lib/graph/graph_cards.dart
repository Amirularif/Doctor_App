import 'package:flutter/material.dart';

class GraphCards extends StatefulWidget {
  final String title;
  final String description;

  const GraphCards({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<GraphCards> createState() => _GraphCardsState();
}

class _GraphCardsState extends State<GraphCards> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 320,
        height: 210,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Center(
              child: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
            ),
            SizedBox(
              height: 50,
            ),
            //description
            Center(
              child: Text(
                widget.description,
                style: TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.italic
                ),),
            ),
          ],
        ),
      ),
    );
  }
}

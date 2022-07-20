import 'package:flutter/material.dart';
import 'dart:async';

class Emoticons extends StatefulWidget {
  final String emoticon;

  const Emoticons({
    Key? key,
    required this.emoticon,
  }) : super(key: key);

  @override
  State<Emoticons> createState() => _EmoticonsState();
}

class _EmoticonsState extends State<Emoticons> {
  var boxColor = Colors.grey.shade200;

  void _changeSelectColor() {
    if(boxColor == Colors.grey.shade400){
      setState((){
        boxColor = Colors.grey.shade200;
      });
    }
    else{
      setState((){
        boxColor = Colors.grey.shade400;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeSelectColor,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsets.all(12),
        duration: Duration(seconds: 0),
        child: Container(
          child: Image.asset(
            widget.emoticon,
            height: 35,
            width: 35,
          ),
        ),
      ),
    );
  }


}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SurveyGraphPage extends StatefulWidget {
  SurveyGraphPage({Key? key}) : super(key: key);

  @override
  _SurveyGraphPageState createState() => _SurveyGraphPageState();
}

class _SurveyGraphPageState extends State<SurveyGraphPage> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Student survey', 25),
      ChartData('GAD-7', 38),
      ChartData('Log', 34),
    ];
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0,20.0,12.0,5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: <Widget>[
                      new CircularPercentIndicator(
                        radius: 45.0,
                        lineWidth: 10.0,
                        animation: true,
                        percent: 0.55,
                        center: new Text(
                        "55.0%",
                        style:
                        new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        linearGradient: LinearGradient(
                          begin: Alignment.topRight,end:Alignment.bottomLeft,
                          colors: <Color> [Colors.cyan,Colors.greenAccent],
                        ),
                        footer: new Text(
                          "\nGAD-7 완성률 ",
                          style:
                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        rotateLinearGradient: true,
                      ),
                    ]),
                  Column(
                      children: <Widget>[
                        new CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 10.0,
                          animation: true,
                          percent: 0.3,
                          center: new Text(
                            "25.0%",
                            style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          linearGradient: LinearGradient(
                            begin: Alignment.topRight,end:Alignment.bottomLeft,
                            colors: <Color> [Colors.pink,Colors.purpleAccent],
                          ),
                          footer: new Text(
                            "\n학생 조사 완성률 ",
                            style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          rotateLinearGradient: true,
                        ),
                      ]),
                  Column(
                      children: <Widget>[
                        new CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 10.0,
                          animation: true,
                          percent: 0.8,
                          center: new Text(
                            "85.0%",
                            style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          linearGradient: LinearGradient(
                              begin: Alignment.topRight,end:Alignment.bottomLeft,
                              colors: <Color> [Colors.deepPurple,Colors.blue],
                              ),
                          footer: new Text(
                            "\n라이프로그 ",
                            style:
                            new TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          rotateLinearGradient: true,
                        ),
                      ])
                ])
          ))
    );
  }
}
  class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
  }
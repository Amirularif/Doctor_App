import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class FitStepGraph extends StatefulWidget {
  const FitStepGraph({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<FitStepGraph> createState() => _FitStepGraphState(token);
}

class _FitStepGraphState extends State<FitStepGraph> {
  String token;
  _FitStepGraphState(this.token);
  
  List finalData = [];
  List<ChartData> chartData = [];

  Future dataReq() async {
    var headers = {
      "Authorization" : "Bearer $token"
    };

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print('date today : $formattedDate');

    var request = http.Request('GET', Uri.parse("https://api.fitbit.com/1/user/-/activities/steps/date/$formattedDate/7d.json"));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final String responseData = await response.stream.bytesToString();
    final data = await json.decode(responseData);

    finalData = data['activities-steps'];
    for (Map<String, dynamic> i in finalData) {
      chartData.add(ChartData.fromJson(i));
    }

    if (response.statusCode == 200) {  
      print('responseData success');
    }
    else {
        print(response.reasonPhrase);
    }
    return responseData;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 320,
        height: 220,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12)
        ),
        child: FutureBuilder(
          future: dataReq(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {     
              return SfCartesianChart(
                title: ChartTitle(
                  text:"Step Count", 
                  textStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  )
                ),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  // Renders line chart
                  ColumnSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.date,
                    yValueMapper: (ChartData data, _) => data.value
                  )
                ]
              );
            }
            else{
              return const Center(child: CircularProgressIndicator());
            } 
          }
        )
      )
    );
  }
}

class ChartData {
  ChartData(this.date, this.value);
  final String date;
  final int value;

  factory ChartData.fromJson(Map<String, dynamic> parsedJson) {
    return ChartData(
      parsedJson["dateTime"].toString(),
      int.parse(parsedJson["value"]),
    );
  }
}

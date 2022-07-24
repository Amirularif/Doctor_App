import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class FitWeightGraph extends StatefulWidget {
  const FitWeightGraph({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<FitWeightGraph> createState() => _FitWeightGraphState(token);
}

class _FitWeightGraphState extends State<FitWeightGraph> {
  String token;
  _FitWeightGraphState(this.token);
  
  List finalData = [];
  List<ChartData> chartData = [];

  Future dataReq() async {
    var headers = {
      "Authorization" : "Bearer $token"
    };

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    var lastweek = now.subtract(Duration(days: 7));
    String lastweekDate = formatter.format(lastweek);
    print('date today : $formattedDate');
    print('date last week : $lastweekDate');

    var request = http.Request('GET', Uri.parse("https://api.fitbit.com/1/user/-/body/log/weight/date/2022-07-10/today.json"));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final String responseData = await response.stream.bytesToString();
    final data = await json.decode(responseData);

    finalData = data["weight"];
    //print(finalData);
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
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.date,
                    yValueMapper: (ChartData data, _) => data.weight
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
  ChartData(this.date, this.weight);
  final String date;
  final int weight;

  factory ChartData.fromJson(Map<String, dynamic> parsedJson) {
    return ChartData(
      parsedJson["date"].toString(),
      parsedJson["weight"],
    );
  }
}
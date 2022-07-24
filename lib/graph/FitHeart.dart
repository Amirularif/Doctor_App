import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class FitHeartGraph extends StatefulWidget {
  const FitHeartGraph({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<FitHeartGraph> createState() => _FitHeartGraphState(token);
}

class _FitHeartGraphState extends State<FitHeartGraph> {
  String token;
  _FitHeartGraphState(this.token);

  //List 
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

    var request = http.Request('GET', Uri.parse("https://api.fitbit.com/1/user/-/activities/heart/date/$formattedDate/1d/1min.json"));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final String responseData = await response.stream.bytesToString();
    final data = await json.decode(responseData);

    if(data["activities-heart-intraday"] != null){
      finalData = data["activities-heart-intraday"]["dataset"];
    }else{
      print("data record null");
    }
    
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
        child:  FutureBuilder(
          future: dataReq(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {     
              return SfCartesianChart(
                title: ChartTitle(
                  text:"Heart Rate", 
                  textStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                  )
                ),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.time,
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
  ChartData(this.time, this.value);
  final String time;
  final int value;

  factory ChartData.fromJson(Map<String, dynamic> parsedJson) {
    return ChartData(
      parsedJson["time"].toString(),
      parsedJson["value"],
    );
  }
}
import 'package:flutter/material.dart';
import '../provider/fetch_daily_data.dart';
import '../models/daily_weather_data.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Future<List<DailyWeatherData>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchDailyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DailyWeatherData>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (contex, index) => Center(
                child: Container(
                  child: Center(
                    child: Text(
                        'Weather at day ${snapshot.data[index].dayTemperature}\u00B0 Weather at night ${snapshot.data[index].nightTemperature}'),
                  ),
                  height: 150.0,
                  width: 310.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

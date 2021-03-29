import 'package:flutter/material.dart';
import 'daily_weather_page.dart';
import '../provider/fetch_daily_data.dart';
import '../models/daily_weather_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<DailyWeatherData>> dailyData;

  @override
  void initState() {
    super.initState();
    dailyData = fetchDailyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: FutureBuilder<List<DailyWeatherData>>(
        future: dailyData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => DailyWeatherPage(
                date: snapshot.data[index].date,
                dayTemperature: snapshot.data[index].dayTemperature,
                nightTemperature: snapshot.data[index].nightTemperature,
                humidity: snapshot.data[index].humidity,
                windSpeed: snapshot.data[index].windSpeed,
                weatherDescription: snapshot.data[index].weatherDescription,
                feelsLikeDay: snapshot.data[index].feelsLikeDay,
                feelsLikeNight: snapshot.data[index].feelsLikeNight,
                weatherIcon: snapshot.data[index].weatherIcon,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

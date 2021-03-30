import 'package:flutter/material.dart';
import 'view_model/daily_weather_page_model.dart';
import '../provider/fetch_daily_data.dart';
import '../models/daily_weather_data.dart';

class DailyWeatherPage extends StatefulWidget {
  @override
  _DailyWeatherPage createState() => _DailyWeatherPage();
}

class _DailyWeatherPage extends State<DailyWeatherPage> {
  Future<List<DailyWeatherData>> dailyData;

  @override
  void initState() {
    super.initState();
    dailyData = fetchDailyData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DailyWeatherData>>(
      future: dailyData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => DailyWeatherPageModel(
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
    );
  }
}

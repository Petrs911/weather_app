import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view_model/daily_weather_page_model.dart';
import '../models/daily_weather_data.dart';
import '../provider/fetch_daily_data.dart';
import '../provider/convert_daily_data_to_list.dart';

class DailyWeatherPage extends StatefulWidget {
  final double longitude;
  final double latitude;

  DailyWeatherPage(this.latitude, this.longitude);

  @override
  _DailyWeatherPage createState() => _DailyWeatherPage();
}

class _DailyWeatherPage extends State<DailyWeatherPage> {
  Future<List<DailyWeatherData>> dailyData;

  Future<String> currentData;

  @override
  void initState() {
    super.initState();
    _checkInternetConection();
  }

  @override
  void didUpdateWidget(DailyWeatherPage oldWidget) {
    if (oldWidget.latitude != widget.latitude &&
        oldWidget.longitude != widget.longitude) {
      _checkInternetConection();
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _checkInternetConection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        currentData = fetchDailyData(widget.longitude, widget.latitude);
        dailyData = dailyDataToList(currentData);
        _saveData(currentData);
      });
    } else {
      setState(() {
        dailyData = dailyDataToList(_getData());
      });
    }
  }

  Future<void> _saveData(Future<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('dailyData', await data);
  }

  Future<String> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String localData = prefs.getString('dailyData');
    return localData;
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

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view_model/hourly_weather_page_model.dart';
import '../models/hourly_weather_data.dart';
import '../provider/convert_hourly_data_to_list.dart';
import '../provider/fetch_hourly_data.dart';

class HourlyWeatherPage extends StatefulWidget {
  final double longitude;
  final double latitude;

  HourlyWeatherPage(this.latitude, this.longitude);

  @override
  _HourlyWeatherPage createState() => _HourlyWeatherPage();
}

class _HourlyWeatherPage extends State<HourlyWeatherPage> {
  Future<List<HourlyWeatherData>> hourlyData;

  Future<String> currentData;

  @override
  void initState() {
    super.initState();
    _checkInternetConection();
  }

  Future<void> _checkInternetConection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        currentData = fetchHourlyData(widget.longitude, widget.latitude);
        hourlyData = hourlyDataToList(currentData);
        _saveData(currentData);
      });
    } else {
      setState(() {
        hourlyData = hourlyDataToList(_getData());
      });
    }
  }

  Future<void> _saveData(Future<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('data', await data);
  }

  Future<String> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String localData = prefs.getString('data');
    return localData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HourlyWeatherData>>(
      future: hourlyData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => HourlyWeatherPageModel(
              date: snapshot.data[index].date,
              dayTemperature: snapshot.data[index].temperature,
              humidity: snapshot.data[index].humidity,
              windSpeed: snapshot.data[index].windSpeed,
              weatherDescription: snapshot.data[index].weatherDescription,
              feelsLikeDay: snapshot.data[index].feelsLike,
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

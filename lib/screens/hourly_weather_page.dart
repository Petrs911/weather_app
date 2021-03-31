import 'package:flutter/material.dart';
import 'view_model/hourly_weather_page_model.dart';
import '../provider/fetch_hourly_data.dart';
import '../provider/get_users_location.dart';
import '../models/hourly_weather_data.dart';

class HourlyWeatherPage extends StatefulWidget {
  @override
  _HourlyWeatherPage createState() => _HourlyWeatherPage();
}

class _HourlyWeatherPage extends State<HourlyWeatherPage> {
  Future<List<HourlyWeatherData>> hourlyData;

  double longitude;
  double latitude;

  GetUserLocation location = GetUserLocation();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      var position = await location.getCurrentLocation();
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    } catch (e) {
      print(e);
    }

    if (latitude != null && longitude != null) {
      setState(() {
        hourlyData = fetchHourlyData(longitude, latitude);
      });
    } else {
      setState(() {
        hourlyData = fetchHourlyData();
      });
    }
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

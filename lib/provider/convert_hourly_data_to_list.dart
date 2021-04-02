import 'dart:convert';

import '../models/hourly_weather_data.dart';

Future<List<HourlyWeatherData>> hourlyDataToList(
    Future<String> response) async {
  var responseJson = json.decode(await response);
  return (responseJson['hourly'] as List)
      .map((x) => HourlyWeatherData.fromJson(x))
      .toList();
}

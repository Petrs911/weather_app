import '../models/hourly_weather_data.dart';
import 'dart:convert';

Future<List<HourlyWeatherData>> hourlyDataToList(
    Future<String> response) async {
  var responseJson = json.decode(await response);
  return (responseJson['daily'] as List)
      .map((x) => HourlyWeatherData.fromJson(x))
      .toList();
}

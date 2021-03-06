import 'dart:convert';

import '../models/daily_weather_data.dart';

Future<List<DailyWeatherData>> dailyDataToList(Future<String> response) async {
  var responseJson = json.decode(await response);
  return (responseJson['daily'] as List)
      .map((x) => DailyWeatherData.fromJson(x))
      .toList();
}

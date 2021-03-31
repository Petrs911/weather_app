import '../models/hourly_weather_data.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List<HourlyWeatherData>> fetchHourlyData(
    [double longitude = 30.52, double latitude = 50.45]) async {
  String locale = Platform.localeName;
  String lang = locale.substring(0, 2);

  var _url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&lang=$lang&units=metric&exclude=daily,current,minutely&appid=bb5ab88dafdd4e21089a105e4832b90e';
  var _uri = Uri.parse(_url);

  var response = await http.get(_uri);

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson['hourly'] as List)
        .map((x) => HourlyWeatherData.fromJson(x))
        .toList();
  } else {
    throw Exception('Failed to load data');
  }
}

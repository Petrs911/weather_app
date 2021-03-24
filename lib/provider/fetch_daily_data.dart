import '../models/daily_weather_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<DailyWeatherData>> fetchDailyData() async {
  var _url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=49.988358&lon=36.232845&units=metric&exclude=hourly,current,minutely&appid=bb5ab88dafdd4e21089a105e4832b90e';
  var _uri = Uri.parse(_url);

  var response = await http.get(_uri);

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson['daily'] as List)
        .map((x) => DailyWeatherData.fromJson(x))
        .toList();
  } else {
    throw Exception('Failde to load data');
  }
}

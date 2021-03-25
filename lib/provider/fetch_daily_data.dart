import '../models/daily_weather_data.dart';
import 'dart:convert';
import 'get_users_location.dart';
import 'package:http/http.dart' as http;

Future<List<DailyWeatherData>> fetchDailyData() async {
  var position = await GetUserLocation().getCurrentPosition();

  double longitude = position.longitude ?? 36.232845;
  double latitude = position.latitude ?? 49.98835;

  var _url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&units=metric&exclude=hourly,current,minutely&appid=bb5ab88dafdd4e21089a105e4832b90e';
  var _uri = Uri.parse(_url);

  var response = await http.get(_uri);
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    return (responseJson['daily'] as List)
        .map((x) => DailyWeatherData.fromJson(x))
        .toList();
  } else {
    throw Exception('Failed to load data');
  }
}

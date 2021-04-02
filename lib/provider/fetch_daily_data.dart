import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> fetchDailyData(double longitude, double latitude) async {
  String lang;
  String locale = Platform.localeName;

  if (locale.substring(0, 2) == 'ru') {
    lang = 'ru';
  } else {
    lang = 'en';
  }

  var _url =
      'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&lang=$lang&units=metric&exclude=hourly,current,minutely&appid=bb5ab88dafdd4e21089a105e4832b90e';
  var _uri = Uri.parse(_url);

  var response = await http.get(_uri);
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
}

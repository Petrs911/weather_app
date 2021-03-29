import 'package:flutter/material.dart';

class DailyWeatherPage extends StatelessWidget {
  final int date;
  final int dayTemperature;
  final int nightTemperature;
  final int humidity;
  final double windSpeed;
  final String weatherDescription;
  final int feelsLikeDay;
  final int feelsLikeNight;
  final String weatherIcon;

  DailyWeatherPage({
    Key key,
    this.date,
    this.dayTemperature,
    this.nightTemperature,
    this.humidity,
    this.windSpeed,
    this.weatherDescription,
    this.feelsLikeDay,
    this.feelsLikeNight,
    this.weatherIcon,
  }) : super(key: key);

  String weekdayToString(int day) {
    var currentDate = DateTime.fromMillisecondsSinceEpoch(day * 1000);

    Map weekdays = {
      1: "Понедельник",
      2: "Вторник",
      3: "Среда",
      4: "Четверг",
      5: "Пятница",
      6: "Суббота",
      7: "Воскресенье",
    };

    return "${weekdays[currentDate.weekday]}, ${currentDate.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          ExpansionTile(
            leading: Image.network(
                'http://openweathermap.org/img/wn/$weatherIcon@2x.png'),
            trailing: Column(
              children: [
                Text('$dayTemperature\u00B0'),
                Text('$nightTemperature\u00B0'),
              ],
            ),
            subtitle: Text('$weatherDescription'),
            title: Text(
              weekdayToString(date),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            expandedAlignment: Alignment.centerLeft,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Ветер'),
                      Text('Влажность'),
                      Text('Днем ощущается как'),
                      Text('Ночью ощущается как'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$windSpeed км/ч'),
                      Text('$humidity%'),
                      Text('$feelsLikeDay\u00B0'),
                      Text('$feelsLikeNight\u00B0'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
            ],
          ),
        ],
      ),
    );
  }
}

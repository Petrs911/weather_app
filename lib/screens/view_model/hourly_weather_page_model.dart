import 'package:flutter/material.dart';

import '../../app_localizations/app_localizations.dart';
import 'timestamp_converter_to_hour.dart';

class HourlyWeatherPageModel extends StatelessWidget {
  final int date;
  final int dayTemperature;
  final int feelsLikeDay;
  final int humidity;
  final double windSpeed;
  final String weatherDescription;
  final String weatherIcon;

  HourlyWeatherPageModel({
    Key key,
    this.date,
    this.dayTemperature,
    this.humidity,
    this.windSpeed,
    this.weatherDescription,
    this.feelsLikeDay,
    this.weatherIcon,
  }) : super(key: key);

  final TimestempConvertreToHour timestampConverter =
      TimestempConvertreToHour();

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
              ],
            ),
            subtitle: Text('$weatherDescription'),
            title: Text(
              timestampConverter.timestampConverter(date),
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
                      Text(
                          AppLocalizations.of(context).translate('wind_speed')),
                      Text(AppLocalizations.of(context).translate('humid')),
                      Text(
                          AppLocalizations.of(context).translate('feels_like')),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          '$windSpeed ${AppLocalizations.of(context).translate('speed')}'),
                      Text('$humidity%'),
                      Text('$feelsLikeDay\u00B0'),
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

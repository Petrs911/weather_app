import 'package:flutter/material.dart';

import '../app_localizations/app_localizations.dart';
import 'hourly_weather_page.dart';
import 'daily_weather_page.dart';

class HomeScreen extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: TextButton(
                  child: Text(AppLocalizations.of(context)
                      .translate('weather_day_button')),
                  onPressed: () {
                    _controller.animateToPage(
                      0,
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate,
                    );
                  },
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  child: Text(AppLocalizations.of(context)
                      .translate('weather_hour_button')),
                  onPressed: () {
                    _controller.animateToPage(
                      1,
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate,
                    );
                  },
                ),
              ),
            ];
          })
        ],
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          DailyWeatherPage(),
          HourlyWeatherPage(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'daily_weather_page.dart';
import 'hourly_weather_page.dart';
import '../app_localizations/app_localizations.dart';
import '../provider/get_users_location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController(initialPage: 0);

  var location = GetUserLocation();

  String currentCity = 'Київ';

  double longitude = 30.523;
  double latitude = 50.45;

  @override
  void initState() {
    super.initState();
    getCity();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      var position = await location.getCurrentLocation();
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCity() async {
    try {
      var city = await location.getAddressFromLatLng();
      setState(() {
        if (city != null) {
          currentCity = city;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentCity),
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
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          DailyWeatherPage(latitude, longitude),
          HourlyWeatherPage(latitude, longitude),
        ],
      ),
    );
  }
}

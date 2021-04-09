class DailyWeatherData {
  final int date;
  final int dayTemperature;
  final int nightTemperature;
  final int humidity;
  final double windSpeed;
  final String weatherDescription;
  final int feelsLikeDay;
  final int feelsLikeNight;
  final String weatherIcon;

  DailyWeatherData(
      {this.date,
      this.dayTemperature,
      this.nightTemperature,
      this.humidity,
      this.windSpeed,
      this.weatherDescription,
      this.feelsLikeDay,
      this.feelsLikeNight,
      this.weatherIcon});

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {
    return DailyWeatherData(
      date: json['dt'],
      dayTemperature: json['temp']['day'].round(),
      nightTemperature: json['temp']['night'].round(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'].toDouble(),
      weatherDescription: json['weather'][0]['description'],
      feelsLikeDay: json['feels_like']['day'].round(),
      feelsLikeNight: json['feels_like']['night'].round(),
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}

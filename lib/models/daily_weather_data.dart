class DailyWeatherData {
  final int date;
  final int dayTemperature;
  final int nightTemperature;
  final int humidity;
  final String weatherDescription;
  final int pressure;
  final int feelsLikeDay;
  final int feelsLikeNight;
  final String weatherIcon;

  DailyWeatherData(
      {this.date,
      this.dayTemperature,
      this.nightTemperature,
      this.humidity,
      this.weatherDescription,
      this.pressure,
      this.feelsLikeDay,
      this.feelsLikeNight,
      this.weatherIcon});

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {
    return DailyWeatherData(
      date: json['dt'],
      dayTemperature: json['temp']['day'].round(),
      nightTemperature: json['temp']['night'].round(),
      humidity: json['humidity'],
      weatherDescription: json['weather']['description'],
      pressure: json['[ressure'],
      feelsLikeDay: json['feels_like']['day'].round(),
      feelsLikeNight: json['feels_like']['night'].round(),
      weatherIcon: json['weather']['icon'],
    );
  }
}

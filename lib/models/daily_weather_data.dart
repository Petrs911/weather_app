class DailyWeatherData {
  final int date;
  final int dayTemperature;
  final int nightTemperature;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int feelsLikeDay;
  final int feelsLikeNight;

  DailyWeatherData(
      {this.date,
      this.dayTemperature,
      this.nightTemperature,
      this.humidity,
      this.windSpeed,
      this.pressure,
      this.feelsLikeDay,
      this.feelsLikeNight});

  factory DailyWeatherData.fromJson(Map<String, dynamic> json) {
    return DailyWeatherData(
      date: json['dt'],
      dayTemperature: json['temp']['day'].round(),
      nightTemperature: json['temp']['night'].round(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      pressure: json['[ressure'],
      feelsLikeDay: json['feels_like']['day'].round(),
      feelsLikeNight: json['feels_like']['night'].round(),
    );
  }
}

class HourlyWeatherData {
  final int date;
  final int temperature;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final int feelsLike;

  HourlyWeatherData(
      {this.date,
      this.temperature,
      this.humidity,
      this.windSpeed,
      this.pressure,
      this.feelsLike});

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherData(
      date: json['dt'],
      temperature: json['temp'].round(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      pressure: json['[ressure'],
      feelsLike: json['feels_like'].round(),
    );
  }
}

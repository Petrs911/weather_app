class HourlyWeatherData {
  final int date;
  final int temperature;
  final int feelsLike;
  final int humidity;
  final double windSpeed;
  final String weatherDescription;
  final String weatherIcon;

  HourlyWeatherData({
    this.date,
    this.temperature,
    this.feelsLike,
    this.humidity,
    this.windSpeed,
    this.weatherDescription,
    this.weatherIcon,
  });

  factory HourlyWeatherData.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherData(
      date: json['dt'],
      temperature: json['temp'].round(),
      feelsLike: json['feels_like'].round(),
      humidity: json['humidity'],
      windSpeed: json['wind_speed'],
      weatherDescription: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}

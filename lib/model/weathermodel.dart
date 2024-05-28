class WeatherModel {
  final String dateInfo;
  final String time;
  final int weatherIcon;
  final String iconPhrase;
  final String temperature;


  const WeatherModel({required this.dateInfo, required this.time, required this.weatherIcon, required this.iconPhrase, required this.temperature});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      dateInfo: json['dateInfo'] ?? 'Unknown Date',
      time: json['time'] ?? 'Unknown Time',
      weatherIcon: json['weatherIcon'] ?? 0,
      iconPhrase: json['iconPhrase'] ?? 'Unknown',
      temperature: json['temperature'] ?? 'Unknown Temperature',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateInfo': dateInfo,
      'time': time,
      'weatherIcon': weatherIcon,
      'iconPhrase': iconPhrase,
      'temperature': temperature
    };
  }


}
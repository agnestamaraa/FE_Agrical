import 'dart:convert';

class ConditionModel {
  final String date;
  final String time;
  final double voltage;
  final int lux;
  final int solarRadiation;
  final int humidity;
  final String temperature;
  final String iconPhrase;
  final int pressure;
  final double windSpeed;
  final int windDirection;
  final double windGust;
  final double rainAmount;
  final bool statusIrigasi;
  final double waterLevel;
  final int moisture;
  final bool isEmergency;

  const ConditionModel({
    required this.date,
    required this.time, 
    required this.voltage, 
    required this.lux, 
    required this.solarRadiation, 
    required this.humidity, 
    required this.temperature, 
    required this.iconPhrase,
    required this.pressure, 
    required this.windSpeed, 
    required this.windDirection, 
    required this.windGust, 
    required this.rainAmount, 
    required this.statusIrigasi, 
    required this.waterLevel, 
    required this.moisture, 
    required this.isEmergency
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json){
    return ConditionModel(
      date: json['date'] ?? 'Unknown Date', 
      time: json['time'] ?? 'Unknown Time', 
      voltage: (json['voltage'] ?? 0.0).toDouble(), 
      lux: json['lux'] ?? 0, 
      solarRadiation: json['solarradiation'] ?? 0, 
      humidity: json['humidity'] ?? 0, 
      temperature: json['temperature'] ?? 'Unknown Temperature', 
      iconPhrase: json['iconPhrase'] ?? 'Unknown Icon Phrase',
      pressure: json['pressure'] ?? 0, 
      windSpeed: (json['windspeed'] ?? 0.0).toDouble(),
      windDirection: json['winddirection'] ?? 0, 
      windGust: (json['windgust'] ?? 0.0).toDouble(), 
      rainAmount: (json['rainamount'] ?? 0.0).toDouble(), 
      statusIrigasi: json['statusirigasi'] ?? false, 
      waterLevel: (json['waterlevel'] ?? 0.0).toDouble(), 
      moisture: json['moisture'] ?? 0, 
      isEmergency: json['isemergency'] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date, 
      'time': time, 
      'voltage': voltage, 
      'lux': lux, 
      'solarradiation': solarRadiation, 
      'humidity': humidity, 
      'temperature': temperature, 
      'iconPhrase': iconPhrase,
      'pressure': pressure, 
      'windspeed': windSpeed,
      'winddirection': windDirection, 
      'windgust': windGust, 
      'rainamount': rainAmount, 
      'statusirigasi': statusIrigasi, 
      'waterlevel': waterLevel, 
      'moisture': moisture, 
      'isemergency': isEmergency
    };
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/weathermodel.dart';

class WeatherService {

  static const String url = 'https://agricalbackend-production.up.railway.app/latestweathercondition';
  Future<WeatherModel> getWeatherFromUrl(String code) async {
    final body = jsonEncode({
        "locationkey": code, 
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var decoded = json.decode(response.body)["data"][0];
      return WeatherModel.fromJson(decoded);
    } else {
      throw Exception();
    }
}
}
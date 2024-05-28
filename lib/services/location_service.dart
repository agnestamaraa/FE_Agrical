import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:kalender_pertanian_ta/model/location.dart";

class LocationService {
  static const String apiUrl = 'https://agricalbackend-production.up.railway.app/getalllokasilahan';

  static Future<List<Location>> getLocations() async {
    
    List<Location> locationList = [];

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      locationList = jsonResponse.map((item) => Location(location: item['lokasi'])).toList();
    } else {
      throw Exception('Failed to load locations');
    }
    return locationList;
  }

}
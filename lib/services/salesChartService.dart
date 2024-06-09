import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/saleschartmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesChartService {

  final String SalesChartURL = 'https://agricalbackend-production.up.railway.app/plant-volume-latest-month';

  Future<SalesChartList> getSalesChart() async {
    // Initialized Time and Pref Variables
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastFetchTime = prefs.getInt('lastFetchTime');
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    // Fetching from Cloud
    if (lastFetchTime == null || (currentTime - lastFetchTime) > 360000/2){
      final res = await http.get(Uri.parse(SalesChartURL));

      if (res.statusCode == 200) {
        var resBody = json.decode(res.body);
        await prefs.setInt('lastFetchTime', currentTime); // Update Fetch Data
        await prefs.setString('salesChartData', json.encode(resBody));
        return SalesChartList.fromJson(resBody);
      } else {
        throw Exception();
      }
    }
    else {
      // Fetching Internally
      String? salesChartData = prefs.getString('salesChartData');
      if (salesChartData != null)  {
        var resBody = json.decode(salesChartData);
        return SalesChartList.fromJson(resBody);
      } else {
        throw Exception();
      }
    }
  } 
}